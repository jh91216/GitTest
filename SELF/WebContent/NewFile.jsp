<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style data-jss="" data-meta="makeStyles">
.jss122 {
  top: 0;
  left: 0;
  width: 100%;
  height: 405vh;
  opacity: 0.4;
  z-index: 1200;
  position: absolute;
  background: #000000;
}
.jss123 {
  top: 0;
  left: 0;
  width: 100%;
  height: auto;
  z-index: 1300;
  position: absolute;
  background: #FFFFFF;
  pointer-events: auto;
}
</style>
</head>
<body>
	<div class="jss123">
		<div class="sc-iqHYGH hSaKRS">
			<div class="sc-crrsfI iDhzRL">
				<fieldset class="MuiFormControl-root" style="padding-top: 22px;">
					<div
						class="MuiPaper-root MuiCard-root jss124 MuiPaper-elevation1 MuiPaper-rounded">
						<div class="jss125">
							<svg class="MuiSvgIcon-root MuiSvgIcon-colorPrimary"
								focusable="false" viewBox="0 0 24 24" aria-hidden="true">
								<path
									d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>
						</div>
						<div class="MuiInputBase-root jss126 MuiInputBase-formControl">
							<input aria-invalid="false" name="searchKeyword"
								placeholder="클래스 검색" type="text"
								class="MuiInputBase-input jss127" value="">
						</div>
					</div>
				</fieldset>
				<div class="sc-bqyKva ehfErK">
					<button
						class="MuiButtonBase-root MuiButton-root MuiButton-text sc-kstrdz itqiHz"
						tabindex="0" type="button">
						<span class="MuiButton-label">오프라인 클래스</span><span
							class="MuiTouchRipple-root"></span>
					</button>
					<button
						class="MuiButtonBase-root MuiButton-root MuiButton-text sc-kstrdz hqBhOD"
						tabindex="0" type="button">
						<span class="MuiButton-label">온라인 Live 클래스</span><span
							class="MuiTouchRipple-root"></span>
					</button>
				</div>
				<div class="sc-hBEYos dWjUC">
					<div class="MuiFormControl-root sc-fFubgz bjNVbG">
						<legend class="sc-fodVxV cYLuAZ">지역</legend>
						<button
							class="MuiButtonBase-root MuiButton-root MuiButton-outlined sc-bkzZxe cSnsVU"
							tabindex="0" type="button" name="locateName" value="전체">
							<span class="MuiButton-label">전체</span><span
								class="MuiTouchRipple-root"></span>
						</button>
					</div>
					<div class="MuiFormControl-root sc-fFubgz bjNVbG">
						<legend class="sc-fodVxV cYLuAZ">카테고리</legend>
						<button
							class="MuiButtonBase-root MuiButton-root MuiButton-outlined sc-bkzZxe cSnsVU"
							tabindex="0" type="button" name="category" value="전체">
							<span class="MuiButton-label">전체</span><span
								class="MuiTouchRipple-root"></span>
						</button>
					</div>
					<div class="MuiFormControl-root sc-fFubgz bjNVbG">
						<legend class="sc-fodVxV cYLuAZ">가격</legend>
						<div
							class="MuiInputBase-root MuiOutlinedInput-root sc-dmlrTW guKkvw MuiInputBase-formControl">
							<input aria-invalid="false" name="minPrice"
								class="MuiInputBase-input MuiOutlinedInput-input" type="text"
								value="0원" inputmode="numeric">
							<fieldset aria-hidden="true"
								class="jss129 MuiOutlinedInput-notchedOutline"
								style="padding-left: 8px;">
								<legend class="jss130" style="width: 0.01px;">
									<span>&ZeroWidthSpace;</span>
								</legend>
							</fieldset>
						</div>
						<span
							class="MuiSlider-root MuiSlider-colorPrimary sc-hHftDr kCQmsc"><span
							class="MuiSlider-rail"></span><span class="MuiSlider-track"
							style="left: 0%; width: 100%;"></span><input type="hidden"
							value="0,1000000"><span
							class="MuiSlider-thumb MuiSlider-thumbColorPrimary" tabindex="0"
							role="slider" data-index="0" aria-labelledby="range-slider"
							aria-orientation="horizontal" aria-valuemax="1000000"
							aria-valuemin="0" aria-valuenow="0" style="left: 0%;"></span><span
							class="MuiSlider-thumb MuiSlider-thumbColorPrimary" tabindex="0"
							role="slider" data-index="1" aria-labelledby="range-slider"
							aria-orientation="horizontal" aria-valuemax="1000000"
							aria-valuemin="0" aria-valuenow="1000000" style="left: 100%;"></span></span>
						<div
							class="MuiInputBase-root MuiOutlinedInput-root sc-dmlrTW guKkvw MuiInputBase-formControl">
							<input aria-invalid="false" name="maxPrice"
								class="MuiInputBase-input MuiOutlinedInput-input" type="text"
								value="1,000,000원" inputmode="numeric">
							<fieldset aria-hidden="true"
								class="jss129 MuiOutlinedInput-notchedOutline"
								style="padding-left: 8px;">
								<legend class="jss130" style="width: 0.01px;">
									<span>&ZeroWidthSpace;</span>
								</legend>
							</fieldset>
						</div>
					</div>
				</div>
				<div class="sc-kfzAmx fTLfYv">
					<button
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" type="button"
						style="background-color: transparent; border: 1px solid rgb(242, 131, 22); color: rgb(242, 131, 22); position: absolute; bottom: 20px; right: 20px;">
						<span class="MuiButton-label">닫기</span><span
							class="MuiTouchRipple-root"></span>
					</button>
					<button
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" type="button"
						style="background-color: rgb(242, 131, 22); color: rgb(255, 255, 255);">
						<span class="MuiButton-label">검색</span><span
							class="MuiTouchRipple-root"></span>
					</button>
				</div>
			</div>
			<hr
				style="width: 100%; height: 1px; background-color: rgb(206, 212, 218); border: 0px; align-self: center; margin-top: 20px; margin-bottom: 20px;">
			<div class="sc-dQppl cQZIoF">
				<legend class="sc-fodVxV cYLuAZ"
					style="font-size: 16px; padding-bottom: 10px;">추천검색어</legend>
				<div class="sc-fKFyDc nwOmR">
					<span class="sc-bBXqnf bGwFiF"><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=위빙"><span
							class="MuiButton-label">위빙</span><span
							class="MuiTouchRipple-root"></span></a><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=향수"><span
							class="MuiButton-label">향수</span><span
							class="MuiTouchRipple-root"></span></a><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=소잉"><span
							class="MuiButton-label">소잉</span><span
							class="MuiTouchRipple-root"></span></a><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=가죽"><span
							class="MuiButton-label">가죽</span><span
							class="MuiTouchRipple-root"></span></a><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=요가"><span
							class="MuiButton-label">요가</span><span
							class="MuiTouchRipple-root"></span></a><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=도자기"><span
							class="MuiButton-label">도자기</span><span
							class="MuiTouchRipple-root"></span></a><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=반지"><span
							class="MuiButton-label">반지</span><span
							class="MuiTouchRipple-root"></span></a><a
						class="MuiButtonBase-root MuiButton-root MuiButton-contained"
						tabindex="0" aria-disabled="false" href="/search?keyword=반려동물"><span
							class="MuiButton-label">반려동물</span><span
							class="MuiTouchRipple-root"></span></a></span><span></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>