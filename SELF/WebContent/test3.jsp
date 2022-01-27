<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="catesub_list filter" id="sub9" style="display: block;">
                    <div class="main">
                        <div class="inbox">
                            <div class="left">지역</div>
                            <div class="right" id="regionSub">
                                <input type="hidden" id="region" value="4">
                                <input type="hidden" id="regionMain" value="0">
                                <select onchange="regionSelect(this.value)">
                                    <option value="">지역</option>
                                                                            <option value="0/0">서울</option>
                                                                                <option value="1/1">경기</option>
                                                                                <option value="2/2">인천</option>
                                                                                <option value="3/3">부산</option>
                                                                        </select>

                                                                    <select id="regionSubLayer0" style="margin-left:10px;" class="on" onchange="regionSubSelect(this.value)">
                                                                                    <option value="1,11,4,13,5,14,9,23">서울 ALL(13)</option>
                                                                                        <option value="1">강남(6)</option>
                                                                                        <option value="11">신림(1)</option>
                                                                                        <option value="4">신촌홍대(1)</option>
                                                                                        <option value="13">회기(1)</option>
                                                                                        <option value="5">종로(1)</option>
                                                                                        <option value="14">건대(1)</option>
                                                                                        <option value="9">잠실(1)</option>
                                                                                        <option value="23">청량리(1)</option>
                                                                                </select>
                                                                        <select id="regionSubLayer1" style="margin-left:10px;" class="off" onchange="regionSubSelect(this.value)">
                                                                                    <option value="29,26">경기 ALL(3)</option>
                                                                                        <option value="29">의정부(2)</option>
                                                                                        <option value="26">분당(1)</option>
                                                                                </select>
                                                                        <select id="regionSubLayer2" style="margin-left:10px;" class="off" onchange="regionSubSelect(this.value)">
                                                                                    <option value="33">인천 ALL(1)</option>
                                                                                        <option value="33">부평(1)</option>
                                                                                </select>
                                                                        <select id="regionSubLayer3" style="margin-left:10px;" class="off" onchange="regionSubSelect(this.value)">
                                                                                    <option value="36">부산 ALL(1)</option>
                                                                                        <option value="36">부산서면(1)</option>
                                                                                </select>
                                    

                                <script>
                                    function regionSelect(value)
                                    {
                                        const values = value.split('/');
                                        const indexMainRegion = values[0];
                                        const mainRegion = values[1];
                                        $('#regionSub').find('.on').addClass('off');
                                        $('#regionSubLayer'+indexMainRegion).removeClass('off');
                                        $('#regionSubLayer'+indexMainRegion).addClass('on');
                                        $('#region').val($('#regionSubLayer'+indexMainRegion+' option:first').val());
                                        $('#regionMain').val(mainRegion);
                                        $('#regionSubLayer'+indexMainRegion).prop("selectedIndex", 0);
                                    }

                                    function regionSubSelect(val)
                                    {
                                        $('#region').val(val);
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="inbox">
                            <div class="left">요일/시간</div>
                            <div class="right">
                                <div class="days">
                                    <ul id="days">
                                                                                <li day="1" class="">월</li>
                                        <li day="2" class="">화</li>
                                        <li day="3" class="">수</li>
                                        <li day="4" class="">목</li>
                                        <li day="5" class="">금</li>
                                        <li day="6" class="">토</li>
                                        <li day="0" class="">일</li>
                                    </ul>
                                    <ul id="times">
                                        <li time="1" style="margin-left:15px;" class="">오전 (06:00~12:00)</li>
                                        <li time="2" class="">오후 (12:00~18:00)</li>
                                        <li time="3" class="">저녁 (18:00~24:00)</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="inbox">
                            <div class="left">수업형태</div>
                            <div class="right">
                                <div class="days">
                                    <ul id="classType">
                                        <li classtype="5" class="">오리지널 VOD</li>
                                        <li classtype="2" class="">온라인 LIVE</li>
                                        <li classtype="3" class="">VOD•녹화영상</li>
                                        <li classtype="1" class="">오프라인</li>
                                        <li classtype="4" class="">전자책</li>
                                    </ul>
                                </div>
                                <div class="days">
                                    <ul id="tTypes">
                                        <li ttype="0" class="">1:1 클래스</li>
                                        <li ttype="1" class="">그룹 클래스</li>
                                        <li ttype="3" class="">원데이</li>
                                        <li ttype="2" class="">다회차</li>
                                    </ul>
                                </div>
                                <div class="filter_button" id="search">
                                    내게 맞는 수업 보기
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</body>
</html>