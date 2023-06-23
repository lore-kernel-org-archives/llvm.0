Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812D0C2FF
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 21:01:12 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7654658834bso115360585a.3
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 14:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687554071; x=1690146071;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11qVrjy8IAmMbt/87EUEHtXkjInkTw7u55u9TIi+mjE=;
        b=Q9oW/dEqBIp9li16smQJ4Ohgbn9I5XuN1zBgEhfDd4VQJ8se9TFSjfU4ceDVGSnI54
         /+A4vuVXyS8huyclLItXwti/f1casMB8Y8L5qvZm7aZy4IPwqKwYzBSoyeTK4WIt3iOc
         8NyHWRJq0gaQI2/MxhzEssNR5g04eokM1X8CaE2Rv4YPmoNTvvK+JqwbJjsn7ecb4sfU
         1jP59dBwpRHNt3EEC+/B4qK72wzP6vWZDEcVSgra3snwNRBGvVXbfRlwss+KA74s7P9a
         jlCLGhuRcNP588LtHE9HdczXecuWc1czV/3cKXewN7wB3kFo8RLvSVA6VBn8NKUWuvf+
         +qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687554071; x=1690146071;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11qVrjy8IAmMbt/87EUEHtXkjInkTw7u55u9TIi+mjE=;
        b=BCRDLlqhbMvnuMwNm/bUfMeu/k63i/z0rH2seF7Klm8bnQQIQ7ZijCu3jvQzPH160S
         QpdB2d1QUIAlNrvVvzX81ddKtf5ZlTtIDMfVxX2hIsGrwOG1fNGSREP8+OisFIbfYUqN
         Gm7WVfU5wkUuljBvrcemi7Ha+oBBMH3y+s5ov6ZLjK3cU+ot0hkRcXI9y8HTJDdKzdEZ
         Ar/ogvsyY6EXzgLdCHXx6GE1/jO/Hq6Fn/Hl16R1oXs4MJXTpfRt3MbearOMVPLMtHV0
         Q6YEyt2fnP6xcdcqEGnOdv4janH7Z47mfM66TcoasTx5XOs0gqY7V9IIyKKaUTwqD5XB
         mNbw==
X-Gm-Message-State: AC+VfDwyvHJZDsRagsoqFb1BIDOgF5Dl/eFxDYnMK6hfgGIvCjNH38dV
	MpqOHYolUTdxupHTdv4oVxiT0+/Ub1hooruynohZSBnonTKoRM/l1m12PSxuAyT9x4ZqOby7v4j
	smHKa46qcinZ5CSMSArUHmRiw/AgQD2wK2VTAQmWTTZzoWFWjqLl1WOsIVymebt9kf989haQ69z
	t7NEI2K8IlTxClag==
X-Google-Smtp-Source: ACHHUZ4/8cI49cxow7v2mSTq7dvoy1hFAlDpuZE200ViVrJMLLcuyR+C6xNSBxnpRLQ/ow5m+WKHp1D10nTWB78JwsEe
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:620a:8906:b0:763:32a6:ddf8 with SMTP id
 ql6-20020a05620a890600b0076332a6ddf8mr18253861qkn.0.1687554071017; Fri, 23
 Jun 2023 14:01:11 -0700 (PDT)
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <calendar-7dd6c1ab-f6ec-4735-a927-7fe9be9af166@google.com>
Date: Fri, 23 Jun 2023 21:01:11 +0000
Subject: Invitation: CBL meetup @ Sat Nov 11, 2023 5am - 2pm (PST) (llvm@lists.linux.dev)
From: Nick Desaulniers <ndesaulniers@google.com>
To: llvm@lists.linux.dev, Kees Cook <keescook@google.com>, 
	Bill Wendling <morbo@google.com>
Content-Type: multipart/mixed; boundary="000000000000f18b2e05fed24c19"

--000000000000f18b2e05fed24c19
Content-Type: multipart/alternative; boundary="000000000000f18b2d05fed24c17"

--000000000000f18b2d05fed24c17
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

Q0JMIG1lZXR1cA0KU2F0dXJkYXkgTm92IDExLCAyMDIzIOKLhSA1YW0g4oCTIDJwbQ0KUGFjaWZp
YyBUaW1lIC0gTG9zIEFuZ2VsZXMNCg0KTG9jYXRpb24NCk9tbmkgUmljaG1vbmQgSG90ZWwsIDEw
MCBTIDEydGggU3QsIFJpY2htb25kLCBWQSAyMzIxOSwgVVNBCQ0KaHR0cHM6Ly93d3cuZ29vZ2xl
LmNvbS9tYXBzL3NlYXJjaC9PbW5pK1JpY2htb25kK0hvdGVsLCsxMDArUysxMnRoK1N0LCtSaWNo
bW9uZCwrVkErMjMyMTksK1VTQT9obD1lbg0KDQpKb2luIHdpdGggR29vZ2xlIE1lZXQNCmh0dHBz
Oi8vbWVldC5nb29nbGUuY29tL3ducS1hYW9zLXhkdj9ocz0yMjQNCg0KDQoJDQpKb2luIGJ5IHBo
b25lDQooVVMpICsxIDUwOS02NzYtMjU3Mg0KUElOOiA0NDk1NDM3MDENCg0KTW9yZSBwaG9uZSBu
dW1iZXJzDQpodHRwczovL3RlbC5tZWV0L3ducS1hYW9zLXhkdj9waW49MzE5MDQxMjM5NDc4MCZo
cz0wDQoNCg0KT3JnYW5pemVyDQpOaWNrIERlc2F1bG5pZXJzDQpuZGVzYXVsbmllcnNAZ29vZ2xl
LmNvbQ0KDQpHdWVzdHMNCk5pY2sgRGVzYXVsbmllcnMgLSBvcmdhbml6ZXINCktlZXMgQ29vaw0K
bGx2bUBsaXN0cy5saW51eC5kZXYNCkJpbGwgV2VuZGxpbmcNClZpZXcgYWxsIGd1ZXN0IGluZm8g
IA0KaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVX
JmVpZD1OMnhvTjJGMVlXTmxaSFUwWTJwMGNqUmpZM1UyYWpacGFtY2diR3gyYlVCc2FYTjBjeTVz
YVc1MWVDNWtaWFkmdG9rPU1qTWpibVJsYzJGMWJHNXBaWEp6UUdkdmIyZHNaUzVqYjIxbE4ySXda
V1JoTkRZeU1UWXpNVFZqT0dJNVl6TTVNbU0zWVRWaU9XSmpORGsyT0dKaVpqUTImY3R6PUFtZXJp
Y2ElMkZMb3NfQW5nZWxlcyZobD1lbiZlcz0wDQoNClJlcGx5IGZvciBsbHZtQGxpc3RzLmxpbnV4
LmRldiBhbmQgdmlldyBtb3JlIGRldGFpbHMgIA0KaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29t
L2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1OMnhvTjJGMVlXTmxaSFUwWTJwMGNqUmpZ
M1UyYWpacGFtY2diR3gyYlVCc2FYTjBjeTVzYVc1MWVDNWtaWFkmdG9rPU1qTWpibVJsYzJGMWJH
NXBaWEp6UUdkdmIyZHNaUzVqYjIxbE4ySXdaV1JoTkRZeU1UWXpNVFZqT0dJNVl6TTVNbU0zWVRW
aU9XSmpORGsyT0dKaVpqUTImY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZobD1lbiZlcz0wDQpZ
b3VyIGF0dGVuZGFuY2UgaXMgb3B0aW9uYWwuDQoNCn5+Ly9+fg0KSW52aXRhdGlvbiBmcm9tIEdv
b2dsZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBv
biB0aGUgZXZlbnQuIFRvICANCnN0b3AgcmVjZWl2aW5nIGZ1dHVyZSB1cGRhdGVzIGZvciB0aGlz
IGV2ZW50LCBkZWNsaW5lIHRoaXMgZXZlbnQuDQoNCkZvcndhcmRpbmcgdGhpcyBpbnZpdGF0aW9u
IGNvdWxkIGFsbG93IGFueSByZWNpcGllbnQgdG8gc2VuZCBhIHJlc3BvbnNlIHRvICANCnRoZSBv
cmdhbml6ZXIsIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBsaXN0LCBpbnZpdGUgb3RoZXJzIHJlZ2Fy
ZGxlc3Mgb2YgIA0KdGhlaXIgb3duIGludml0YXRpb24gc3RhdHVzLCBvciBtb2RpZnkgeW91ciBS
U1ZQLg0KDQpMZWFybiBtb3JlIGh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL2NhbGVuZGFyL2Fu
c3dlci8zNzEzNSNmb3J3YXJkaW5nDQo=
--000000000000f18b2d05fed24c17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!doctype html><html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:=
schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:offi=
ce"><head><title></title><!--[if !mso]><meta http-equiv=3D"X-UA-Compatible"=
 content=3D"IE=3Dedge"><![endif]--><meta http-equiv=3D"Content-Type" conten=
t=3D"text/html; charset=3DUTF-8"><meta name=3D"viewport" content=3D"width=
=3Ddevice-width,initial-scale=3D1"><meta name=3D"color-scheme" content=3D"l=
ight dark"><meta name=3D"supported-color-schemes" content=3D"light dark">
    <style>
      body, html {
        font-family: Roboto, Helvetica, Arial, sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
      }

      #outlook a {
        padding: 0;
      }

      .ReadMsgBody {
        width: 100%;
      }

      .ExternalClass {
        width: 100%;
      }

      .ExternalClass * {
        line-height: 100%;
      }

      table,
      td {
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
      }

      img {
        border: 0;
        height: auto;
        line-height: 100%;
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }

      p {
        display: block;
        margin: 13px 0;
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      @media only screen and (max-width:580px) {
        @-ms-viewport {
          width: 320px;
        }

        @viewport {
          width: 320px;
        }
      }
    </style>
    <!--<![endif]-->
    <!--[if mso]>
          <xml>
          <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml>
          <![endif]-->
    <!--[if lte mso 11]>
          <style>
            .outlook-group-fix { width:100% !important; }
          </style>
    <![endif]-->

    <!--[if !mso]><!-- -->
  <style>body, html {font-family:Roboto,Helvetica,Arial,sans-serif;}@font-f=
ace {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxP.ttf) forma=
t('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v149/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v137/Gw6kwdfw6UnXLJCcm=
afZyFRXb3BL9rvi0QZG3g.otf) format('opentype');
}

.google-material-icons {
  font-family: 'Google Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Material Icons Filled';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v113/WWXFlimHYg6=
HKI3TavMkbKdhBmDvgach8TVpeGsuueSZJH4.otf) format('opentype');
}

.google-material-icons-filled {
  font-family: 'Google Material Icons Filled';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UaGrENHsxJlGDuGo1OIlL3Owps=
.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLU94Yt=
zCwM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLV154t=
zCwM.ttf) format('truetype');
}
</style><!--<![endif]-->
      <style>
        .body-container {
          padding-left: 16px;
          padding-right: 16px;
        }
      </style>
 =20
      <style>
        u+.body .body-container,
        body[data-outlook-cycle] .body-container,
        #MessageViewBody .body-container {
          padding-left: 0;
          padding-right: 0;
        }
      </style>
 =20
    <style>
      @media only screen and (min-width:580px) {
        .column-per-37 {
          width: 37% !important;
          max-width: 37%;
        }

        .column-per-63 {
          width: 63% !important;
          max-width: 63%;
        }
      }
    </style>
 =20
    <style>
      .appointment-buttons th {
        display: block;
        clear: both;
        float: left;
        margin-top: 12px;
      }

      .appointment-buttons th a {
        float: left;
      }

      #MessageViewBody .appointment-buttons th {
       margin-top: 24px;
      }
    </style>
 =20
    <style>
      @media only screen and (max-width:580px) {
        table.full-width-mobile {
          width: 100% !important;
        }

        td.full-width-mobile {
          width: auto !important;
        }
      }
    </style>
    <style>
      .main-container-inner,
      .info-bar-inner {
        padding: 12px 16px !important;
      }

      .main-column-table-ltr {
        padding-right: 0 !important;
      }

      .main-column-table-rtl {
        padding-left: 0 !important;
      }

      @media only screen and (min-width:580px) {
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .main-column-table-ltr {
          padding-right: 32px !important;
        }

        .main-column-table-rtl {
          padding-left: 32px !important;
        }

        .appointment-buttons th {
          display: table-cell;
          clear: none;
        }
      }

      .primary-text {
        color: #3c4043 !important;
      }

      .secondary-text,
      .phone-number a {
        color: #70757a !important;
      }

      .accent-text {
        color: #1a73e8 !important;
      }

      .accent-text-dark {
        color: #185abc !important;
      }

      .grey-button-text,
      .attachment-chip a {
        color: #5f6368 !important;
      }

      .primary-button {
        background-color: #1a73e8 !important;
      }

      .primary-button-text {
        color: #fff !important;
      }

      .underline-on-hover:hover {
        text-decoration: underline !important;
      }

      .grey-infobar-text {
        color: #202124 !important;
      }

      @media (prefers-color-scheme: dark) {
        .primary-text:not([class^=3D"x_"]) {
          color: #e8eaed !important;
        }

        .secondary-text:not([class^=3D"x_"]),
        .phone-number:not([class^=3D"x_"]) a {
          color: #9aa0a6 !important;
        }

        .grey-button-text:not([class^=3D"x_"]),
        .attachment-chip:not([class^=3D"x_"]) a {
          color: #bdc1c6 !important;
        }

        .accent-text:not([class^=3D"x_"]),
        .hairline-button-text:not([class^=3D"x_"]) {
          color: #8ab4f8 !important;
        }

        .primary-button:not([class^=3D"x_"]) {
          background-color: #8ab4f8 !important;
        }

        .primary-button-text:not([class^=3D"x_"]) {
          color: #202124 !important;
        }
      }
    </style>
    <style>
      @media (prefers-color-scheme: dark) {
        .cse-banner:not([class^=3D"x_"]) {
          background-color: #3c4043 !important; /* Google Grey 800 */
        }

        .encryption-icon:not([class^=3D"x_"]) {
          /* WARNING: This causes the whole style tag to get stripped in Gm=
ail. */
          background-image: url('https://fonts.gstatic.com/s/i/googlemateri=
aliconsfilled/encrypted/v3/gm_grey200-24dp/2x/gm_filled_encrypted_gm_grey20=
0_24dp.png') !important;
        }
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      .prevent-link a {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
      }
    </style>
    <!--<![endif]-->

    <!--[if mso | IE]>
      <style>
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .cse-banner .encryption-icon {
          /* We use the IE workaround instead. */
          background-image: none !important;
        }

        .cse-banner .encryption-icon .ms-fallback {
          display: block !important;
        }

        /* NB: Some MS clients ignore dark-scheme styling and apply their o=
wn, so there's nothing we can do to help there. */
        @media (prefers-color-scheme: dark) {
          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback {
            display: none !important;
          }

          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback-da=
rk {
            display: block !important;
          }
        }
      </style>
    <![endif]-->
  </head><body class=3D"body"><span itemscope itemtype=3D"http://schema.org=
/InformAction"><span style=3D"display:none" itemprop=3D"about" itemscope it=
emtype=3D"http://schema.org/Person"><meta itemprop=3D"description" content=
=3D"Invitation from Nick Desaulniers"/></span><span itemprop=3D"object" ite=
mscope itemtype=3D"http://schema.org/Event"><meta itemprop=3D"eventStatus" =
content=3D"http://schema.org/EventScheduled"/><span itemprop=3D"publisher" =
itemscope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"nam=
e" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleCale=
ndar" content=3D"7lh7auacedu4cjtr4ccu6j6ijg"/><span style=3D"display: none;=
 font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; w=
idth: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">CBL=
 meetup</span><meta itemprop=3D"url" content=3D"https://calendar.google.com=
/calendar/event?action=3DVIEW&amp;eid=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamc=
gbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21l=
N2IwZWRhNDYyMTYzMTVjOGI5YzM5MmM3YTViOWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLo=
s_Angeles&amp;hl=3Den&amp;es=3D0"/><span aria-hidden=3D"true"><time itempro=
p=3D"startDate" datetime=3D"20231111T130000Z"></time><time itemprop=3D"endD=
ate" datetime=3D"20231111T220000Z"></time></span><div style=3D"display: non=
e; font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0;=
 width: 0; max-width: 0; opacity: 0; overflow: hidden;">Join with Google Me=
et =E2=80=93 You have been invited by Nick Desaulniers to attend an event n=
amed CBL meetup on Saturday Nov 11, 2023 =E2=8B=85 5am =E2=80=93 2pm (Pacif=
ic Time - Los Angeles).</div><table border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%;" clas=
s=3D"body-container"><tbody><tr><td style=3D"" class=3D"" align=3D"left"><!=
--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" rol=
e=3D"presentation"><tr><td height=3D"16" style=3D"height:16px;"><![endif]--=
><div style=3D"height:16px;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso=
 | IE]></td></tr></table><![endif]--><table border=3D"0" cellpadding=3D"0" =
cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100=
%;" class=3D""><tbody><tr><td style=3D"border: solid 1px #dadce0; border-ra=
dius: 8px; direction: rtl; font-size: 0; padding: 24px 32px; text-align: le=
ft; vertical-align: top;" class=3D"main-container-inner"><!--[if mso | IE]>=
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n"><tr><![endif]--><!--[if mso | IE]><td class=3D"" style=3D"vertical-align=
:top;width:37%;" ><![endif]--><div class=3D"column-per-37 outlook-group-fix=
" style=3D"font-size: 13px; text-align: left; direction: ltr; display: inli=
ne-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap: bre=
ak-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"p=
resentation" width=3D"100%"><tbody><tr><td style=3D"vertical-align:top;padd=
ing:0;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pre=
sentation" width=3D"100%"><tr><td style=3D"font-size: 0; padding: 0; text-a=
lign: left; word-break: break-word;;padding-bottom:28px;"><a href=3D"https:=
//meet.google.com/wnq-aaos-xdv?hs=3D224" class=3D"primary-button-text" styl=
e=3D"display: inline-block;font-family: &#39;Google Sans&#39;, Roboto, sans=
-serif;font-size: 14px; letter-spacing: 0.25px; line-height: 20px; mso-line=
-height-rule: exactly; text-decoration: none; text-transform: none; word-wr=
ap: break-word; white-space: nowrap;color: #fff;font-weight: 700;white-spac=
e: normal;" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspa=
cing=3D"0" role=3D"presentation" style=3D"display: inline-block"><tr><td al=
ign=3D"center" role=3D"presentation" valign=3D"middle" style=3D"background-=
color: #1a73e8; cursor: auto; padding: 10px 25px; border: none; border-radi=
us: 4px; margin: 0;" class=3D"primary-button"><!--[if mso]><a href=3D"https=
://meet.google.com/wnq-aaos-xdv?hs=3D224" class=3D"primary-button-text" tar=
get=3D"_blank"><![endif]--><span class=3D"primary-button-text" style=3D"fon=
t-family: &#39;Google Sans&#39;, Roboto, sans-serif;font-size: 14px; letter=
-spacing: 0.25px; line-height: 20px; mso-line-height-rule: exactly; text-de=
coration: none; text-transform: none; word-wrap: break-word; white-space: n=
owrap;color: #fff;font-weight: 700;white-space: normal;">Join with Google M=
eet</span><!--[if mso]></a><![endif]--></td></tr></table></a></td></tr><tr>=
<td style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-=
word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;f=
ont-size: 14px; line-height: 20px; mso-line-height-rule: exactly; text-alig=
n: left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"p=
resentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-te=
xt" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-wei=
ght: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Meetin=
g link</h2></td></tr></table><!-- Use grey text for the Meet link--><div><a=
 style=3D"display: inline-block;;color: #70757a; text-decoration: none;" cl=
ass=3D"secondary-text underline-on-hover" href=3D"https://meet.google.com/w=
nq-aaos-xdv?hs=3D224">meet.google.com/wnq-aaos-xdv</a></div></div></td></tr=
><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: b=
reak-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-se=
rif;font-size: 14px; line-height: 20px; mso-line-height-rule: exactly; text=
-align: left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"prima=
ry-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;fon=
t-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">J=
oin by phone</h2></td></tr></table><span class=3D"secondary-text" style=3D"=
color: #70757a; text-decoration: none;;">(US) </span><a href=3D"tel:+1-509-=
676-2572%3B449543701%23" style=3D"display: inline-block;color: #1a73e8; tex=
t-decoration: none;" target=3D"_blank" class=3D"accent-text underline-on-ho=
ver">+1 509-676-2572</a> <br><span class=3D"secondary-text" style=3D"color:=
 #70757a; text-decoration: none;;">PIN: 449543701</span><br><br><a href=3D"=
https://tel.meet/wnq-aaos-xdv?pin=3D3190412394780&amp;hs=3D0" style=3D"disp=
lay: inline-block;color: #1a73e8; text-decoration: none;" target=3D"_blank"=
 class=3D"accent-text underline-on-hover">More phone numbers</a><br></div><=
/td></tr></table></td></tr></tbody></table></div><!--[if mso | IE]></td><![=
endif]--><!--[if mso | IE]><td class=3D"" style=3D"vertical-align:top;width=
:63%;padding-right:32px;" ><![endif]--><div class=3D"column-per-63 outlook-=
group-fix" style=3D"font-size: 13px; text-align: left; direction: ltr; disp=
lay: inline-block; vertical-align: top; width: 100%;overflow: hidden; word-=
wrap: break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
role=3D"presentation" width=3D"100%" class=3D"main-column-table-ltr" style=
=3D"padding-right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><tr>=
<td class=3D"main-column-td" style=3D"padding:0; vertical-align:top;"><tabl=
e border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" wi=
dth=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0; =
padding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"=
><div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-wei=
ght: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: =
#3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presentatio=
n"><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"2023=
1111T130000Z"></time><time itemprop=3D"endDate" datetime=3D"20231111T220000=
Z"></time></span><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"pri=
mary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;f=
ont-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;"=
>When</h2></td></tr></table><span>Saturday Nov 11, 2023 =E2=8B=85 5am =E2=
=80=93 2pm (Pacific Time - Los Angeles)</span></div></td></tr><tr><td style=
=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;pad=
ding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style=
: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spac=
ing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" r=
ole=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0=
" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D=
"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: no=
ne;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding:=
 0;">Location</h2></td></tr></table><span itemprop=3D"location" itemscope i=
temtype=3D"http://schema.org/Place"><span itemprop=3D"name" class=3D"primar=
y-text notranslate" style=3D"font-family: Roboto, sans-serif;font-style: no=
rmal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing:=
 0.2px;color: #3c4043; text-decoration: none;">Omni Richmond Hotel, 100 S 1=
2th St, Richmond, VA 23219, USA</span><br/><a href=3D"https://www.google.co=
m/maps/search/Omni+Richmond+Hotel,+100+S+12th+St,+Richmond,+VA+23219,+USA?h=
l=3Den" class=3D"accent-text underline-on-hover" style=3D"display: inline-b=
lock;;color: #1a73e8; text-decoration: none;font-weight: 700;" target=3D"_b=
lank" itemprop=3D"map">View map</a></span></div></td></tr><tr><td style=3D"=
font-size: 0; padding: 0; text-align: left; word-break: break-word;;padding=
-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: no=
rmal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing:=
 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=
=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" r=
ole=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"pr=
imary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;=
font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;=
">Guests</h2></td></tr></table><div style=3D"padding-bottom: 4px; text-alig=
n: left;;color: #3c4042;"><div><span itemprop=3D"attendee" itemscope itemty=
pe=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslat=
e"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bl=
ock;;color: #3c4043; text-decoration: none;" href=3D"mailto:ndesaulniers@go=
ogle.com">Nick Desaulniers</a></span><meta itemprop=3D"email" content=3D"nd=
esaulniers@google.com"/></span><span itemprop=3D"organizer" itemscope itemt=
ype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=3D"Nick De=
saulniers"/><meta itemprop=3D"email" content=3D"ndesaulniers@google.com"/><=
/span><span class=3D"secondary-text" style=3D"color: #70757a; text-decorati=
on: none;"> - organizer</span></div><div><span itemprop=3D"attendee" itemsc=
ope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"=
notranslate"><a class=3D"primary-text underline-on-hover" style=3D"display:=
 inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:keesc=
ook@google.com">Kees Cook</a></span><meta itemprop=3D"email" content=3D"kee=
scook@google.com"/></span><span class=3D"secondary-text" style=3D"color: #7=
0757a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee=
" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" c=
lass=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"=
display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mail=
to:llvm@lists.linux.dev">llvm@lists.linux.dev</a></span><meta itemprop=3D"e=
mail" content=3D"llvm@lists.linux.dev"/></span><span class=3D"secondary-tex=
t" style=3D"color: #70757a; text-decoration: none;"></span></div><div><span=
 itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><spa=
n itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underlin=
e-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration=
: none;" href=3D"mailto:morbo@google.com">Bill Wendling</a></span><meta ite=
mprop=3D"email" content=3D"morbo@google.com"/></span><span class=3D"seconda=
ry-text" style=3D"color: #70757a; text-decoration: none;"></span></div></di=
v><a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp;e=
id=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamcgbGx2bUBsaXN0cy5saW51eC5kZXY&amp;to=
k=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21lN2IwZWRhNDYyMTYzMTVjOGI5YzM5MmM3YTV=
iOWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" s=
tyle=3D"display: inline-block;;color: #1a73e8; text-decoration: none;font-w=
eight: 700;" target=3D"_blank" class=3D"accent-text underline-on-hover">Vie=
w all guest info</a></div></td></tr><tr><td style=3D"font-size: 0; padding:=
 0; text-align: left; word-break: break-word;;padding-bottom:0px;"><div sty=
le=3D"color: #3c4043; text-decoration: none;;font-family: Roboto, sans-seri=
f;font-size: 14px; line-height: 20px; mso-line-height-rule: exactly; text-a=
lign: left;" class=3D"primary-text"><div><span style=3D"font-weight: 700;-w=
ebkit-font-smoothing: antialiased;">Reply</span><span class=3D"secondary-te=
xt" style=3D"color: #70757a; text-decoration: none;"> for <a class=3D"secon=
dary-text underline-on-hover" style=3D"display: inline-block;;color: #70757=
a; text-decoration: none;" href=3D"mailto:llvm@lists.linux.dev">llvm@lists.=
linux.dev</a></span></div></div></td></tr><tr><td style=3D"font-size: 0; pa=
dding: 0; text-align: left; word-break: break-word;;padding-bottom:16px;"><=
div style=3D"font-family: Roboto, sans-serif;font-size: 14px; line-height: =
20px; mso-line-height-rule: exactly; text-align: left;"><table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border-=
collapse: separate;"><tr><td style=3D"padding-top: 8px; padding-left: 0; pa=
dding-right: 12px;"><!-- RSVP buttons --><table border=3D"0" cellpadding=3D=
"0" cellspacing=3D"0" role=3D"presentation" style=3D"border: solid 1px #dad=
ce0; border-radius: 16px; border-collapse: separate;font-family: &#39;Googl=
e Sans&#39;, Roboto, sans-serif;;display: inline-block;;margin-right: 12px;=
 margin-left: 0;"><tr><td align=3D"center" vertical-align=3D"middle" role=
=3D"presentation"><span itemprop=3D"potentialaction" itemscope itemtype=3D"=
http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http=
://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope ite=
mtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" hre=
f=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f636=
7;"><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&=
amp;eid=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamcgbGx2bUBsaXN0cy5saW51eC5kZXY&a=
mp;rst=3D1&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21lN2IwZWRhNDYyMTYzMT=
VjOGI5YzM5MmM3YTViOWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#=
39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%;=
 mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tran=
sform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=
=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-space: n=
owrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?=
action=3DRESPOND&amp;eid=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamcgbGx2bUBsaXN0=
cy5saW51eC5kZXY&amp;rst=3D1&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21lN=
2IwZWRhNDYyMTYzMTVjOGI5YzM5MmM3YTViOWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLos=
_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url=
" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"f=
ont-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;colo=
r: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exact=
ly; margin: 0; text-decoration: none; text-transform: none;">Yes</span><!--=
[if mso]></a><![endif]--></td></tr></table></a></span></span></span></td><t=
d align=3D"center" vertical-align=3D"middle" role=3D"presentation" style=3D=
"border-left: solid 1px #dadce0; border-right: solid 1px #dadce0;"><span it=
emprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpActi=
on"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendan=
ce/No"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/=
HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/Http=
RequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://cale=
ndar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DN2xoN2F1YWNlZHU0Y=
2p0cjRjY3U2ajZpamcgbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D2&amp;tok=3DMjMjbm=
Rlc2F1bG5pZXJzQGdvb2dsZS5jb21lN2IwZWRhNDYyMTYzMTVjOGI5YzM5MmM3YTViOWJjNDk2O=
GJiZjQ2&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"fo=
nt-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color=
: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactl=
y; margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-b=
utton-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadd=
ing=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" =
role=3D"presentation" valign=3D"middle" style=3D"padding: 6px 12px; white-s=
pace: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar=
/event?action=3DRESPOND&amp;eid=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamcgbGx2b=
UBsaXN0cy5saW51eC5kZXY&amp;rst=3D2&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS=
5jb21lN2IwZWRhNDYyMTYzMTVjOGI5YzM5MmM3YTViOWJjNDk2OGJiZjQ2&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=
=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" sty=
le=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-ser=
if;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule=
: exactly; margin: 0; text-decoration: none; text-transform: none;">No</spa=
n><!--[if mso]></a><![endif]--></td></tr></table></a></span></span></span><=
/td><td align=3D"center" vertical-align=3D"middle" role=3D"presentation"><s=
pan itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/Rs=
vpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAt=
tendance/Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"http://sc=
hema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema=
.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"htt=
ps://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DN2xoN2F1=
YWNlZHU0Y2p0cjRjY3U2ajZpamcgbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D3&amp;tok=
=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21lN2IwZWRhNDYyMTYzMTVjOGI5YzM5MmM3YTVi=
OWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" st=
yle=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-se=
rif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rul=
e: exactly; margin: 0; text-decoration: none; text-transform: none;" class=
=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0=
" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=
=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padding: 6px 0=
; padding-left: 12px; padding-right: 16px; white-space: nowrap;"><!--[if ms=
o]><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&a=
mp;eid=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamcgbGx2bUBsaXN0cy5saW51eC5kZXY&am=
p;rst=3D3&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21lN2IwZWRhNDYyMTYzMTV=
jOGI5YzM5MmM3YTViOWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3D=
en&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank=
"><![endif]--><span class=3D"grey-button-text" style=3D"font-weight: 400;fo=
nt-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-s=
ize: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; tex=
t-decoration: none; text-transform: none;">Maybe</span><!--[if mso]></a><![=
endif]--></td></tr></table></a></span></span></span></td></tr></table><!-- =
More options --><a href=3D"https://calendar.google.com/calendar/event?actio=
n=3DVIEW&amp;eid=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamcgbGx2bUBsaXN0cy5saW51=
eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21lN2IwZWRhNDYyMTYzMTVjO=
GI5YzM5MmM3YTViOWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den=
&amp;es=3D0" style=3D"display: inline-block;;font-weight: 400;font-family: =
&#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; =
line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decoratio=
n: none; text-transform: none;" class=3D"grey-button-text" target=3D"_blank=
"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentat=
ion" style=3D"border: solid 1px #dadce0; border-radius: 16px; border-collap=
se: separate;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;"><tr><=
td align=3D"center" vertical-align=3D"middle" role=3D"presentation" style=
=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-space: n=
owrap;;color: #5f6367;"><!--[if mso]><a href=3D"https://calendar.google.com=
/calendar/event?action=3DVIEW&amp;eid=3DN2xoN2F1YWNlZHU0Y2p0cjRjY3U2ajZpamc=
gbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb21l=
N2IwZWRhNDYyMTYzMTVjOGI5YzM5MmM3YTViOWJjNDk2OGJiZjQ2&amp;ctz=3DAmerica%2FLo=
s_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" target=3D"_bla=
nk"><![endif]--><span class=3D"grey-button-text" style=3D"font-weight: 400;=
font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font=
-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; t=
ext-decoration: none; text-transform: none;">More options</span><!--[if mso=
]></a><![endif]--></td></tr></table></a></td></tr></table></div></td></tr><=
/table></td></tr></tbody></table></div><!--[if mso | IE]></td><![endif]--><=
!--[if mso | IE]></tr></table><![endif]--></td></tr></tbody></table><table =
border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" alig=
n=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"font-=
size: 0; padding: 0; text-align: left; word-break: break-word;;padding:4px =
12px;" class=3D"" align=3D"left"><div class=3D"secondary-text" style=3D"col=
or: #70757a; text-decoration: none;font-family: Roboto, sans-serif;font-siz=
e: 12px; line-height: 16px; mso-line-height-rule: exactly; text-align: left=
;"><p>Invitation from <a href=3D"https://calendar.google.com/calendar/" cla=
ss=3D"accent-text underline-on-hover" style=3D"font-family: Roboto, sans-se=
rif;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly;;colo=
r: #1a73e8; text-decoration: none;" target=3D"_blank">Google Calendar</a></=
p><p>You are receiving this email because you are an attendee on the event.=
 To stop receiving future updates for this event, decline this event.</p><p=
>Forwarding this invitation could allow any recipient to send a response to=
 the organizer, be added to the guest list, invite others regardless of the=
ir own invitation status, or modify your RSVP. <a class=3D"accent-text unde=
rline-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12px; l=
ine-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decor=
ation: none;" href=3D"https://support.google.com/calendar/answer/37135#forw=
arding">Learn more</a></p></div></td></tr></tbody></table></td></tr></tbody=
></table></span></span></body></html>
--000000000000f18b2d05fed24c17
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VTIMEZONE
TZID:America/New_York
X-LIC-LOCATION:America/New_York
BEGIN:DAYLIGHT
TZOFFSETFROM:-0500
TZOFFSETTO:-0400
TZNAME:EDT
DTSTART:19700308T020000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU
END:DAYLIGHT
BEGIN:STANDARD
TZOFFSETFROM:-0400
TZOFFSETTO:-0500
TZNAME:EST
DTSTART:19701101T020000
RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU
END:STANDARD
END:VTIMEZONE
BEGIN:VEVENT
DTSTART;TZID=America/New_York:20231111T080000
DTEND;TZID=America/New_York:20231111T170000
DTSTAMP:20230623T210110Z
ORGANIZER;CN=Nick Desaulniers:mailto:ndesaulniers@google.com
UID:7lh7auacedu4cjtr4ccu6j6ijg@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Kees Cook;X-NUM-GUESTS=0:mailto:keescook@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=llvm@lists.linux.dev;X-NUM-GUESTS=0:mailto:llvm@lists.linux.dev
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Bill Wendling;X-NUM-GUESTS=0:mailto:morbo@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=Nick Desaulniers;X-NUM-GUESTS=0:mailto:ndesaulniers@google.com
X-GOOGLE-CONFERENCE:https://meet.google.com/wnq-aaos-xdv
X-MICROSOFT-CDO-OWNERAPPTID:1743767684
CREATED:20230501T203621Z
DESCRIPTION:-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~::~:~::-\nJoin with Google Meet: https://meet.google.com/wn
 q-aaos-xdv\nOr dial: (US) +1 509-676-2572 PIN: 449543701#\nMore phone numbe
 rs: https://tel.meet/wnq-aaos-xdv?pin=3190412394780&hs=7\n\nLearn more abou
 t Meet at: https://support.google.com/a/users/answer/9282720\n\nPlease do n
 ot edit this section.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20230623T210109Z
LOCATION:Omni Richmond Hotel\, 100 S 12th St\, Richmond\, VA 23219\, USA
SEQUENCE:1
STATUS:CONFIRMED
SUMMARY:CBL meetup
TRANSP:TRANSPARENT
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:This is an event reminder
TRIGGER:-P1D
END:VALARM
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:This is an event reminder
TRIGGER:-P7D
END:VALARM
END:VEVENT
END:VCALENDAR

--000000000000f18b2d05fed24c17--
--000000000000f18b2e05fed24c19
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFtZXJpY2EvTmV3X1lvcmsNClgtTElDLUxPQ0FUSU9O
OkFtZXJpY2EvTmV3X1lvcmsNCkJFR0lOOkRBWUxJR0hUDQpUWk9GRlNFVEZST006LTA1MDANClRa
T0ZGU0VUVE86LTA0MDANClRaTkFNRTpFRFQNCkRUU1RBUlQ6MTk3MDAzMDhUMDIwMDAwDQpSUlVM
RTpGUkVRPVlFQVJMWTtCWU1PTlRIPTM7QllEQVk9MlNVDQpFTkQ6REFZTElHSFQNCkJFR0lOOlNU
QU5EQVJEDQpUWk9GRlNFVEZST006LTA0MDANClRaT0ZGU0VUVE86LTA1MDANClRaTkFNRTpFU1QN
CkRUU1RBUlQ6MTk3MDExMDFUMDIwMDAwDQpSUlVMRTpGUkVRPVlFQVJMWTtCWU1PTlRIPTExO0JZ
REFZPTFTVQ0KRU5EOlNUQU5EQVJEDQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCkRUU1RB
UlQ7VFpJRD1BbWVyaWNhL05ld19Zb3JrOjIwMjMxMTExVDA4MDAwMA0KRFRFTkQ7VFpJRD1BbWVy
aWNhL05ld19Zb3JrOjIwMjMxMTExVDE3MDAwMA0KRFRTVEFNUDoyMDIzMDYyM1QyMTAxMTBaDQpP
UkdBTklaRVI7Q049TmljayBEZXNhdWxuaWVyczptYWlsdG86bmRlc2F1bG5pZXJzQGdvb2dsZS5j
b20NClVJRDo3bGg3YXVhY2VkdTRjanRyNGNjdTZqNmlqZ0Bnb29nbGUuY29tDQpBVFRFTkRFRTtD
VVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJ
T047UlNWUD0NCiBUUlVFO0NOPUtlZXMgQ29vaztYLU5VTS1HVUVTVFM9MDptYWlsdG86a2Vlc2Nv
b2tAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1sbHZtQGxpc3RzLmxp
bnV4LmRldjtYLU5VTS1HVUVTVFM9MDptYWlsdG86bGx2bUBsaXN0cy5saW51eC5kZXYNCkFUVEVO
REVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURT
LUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049QmlsbCBXZW5kbGluZztYLU5VTS1HVUVTVFM9MDptYWls
dG86bW9yYm9AZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEt
UEFSVElDSVBBTlQ7UEFSVFNUQVQ9QUNDRVBURUQ7UlNWUD1UUlVFDQogO0NOPU5pY2sgRGVzYXVs
bmllcnM7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm5kZXNhdWxuaWVyc0Bnb29nbGUuY29tDQpYLUdP
T0dMRS1DT05GRVJFTkNFOmh0dHBzOi8vbWVldC5nb29nbGUuY29tL3ducS1hYW9zLXhkdg0KWC1N
SUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOjE3NDM3Njc2ODQNCkNSRUFURUQ6MjAyMzA1MDFUMjAz
NjIxWg0KREVTQ1JJUFRJT046LTo6fjp+Ojp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+DQogOn46fjp+On46fjp+On46fjo6fjp+OjotXG5Kb2lu
IHdpdGggR29vZ2xlIE1lZXQ6IGh0dHBzOi8vbWVldC5nb29nbGUuY29tL3duDQogcS1hYW9zLXhk
dlxuT3IgZGlhbDogKFVTKSArMSA1MDktNjc2LTI1NzIgUElOOiA0NDk1NDM3MDEjXG5Nb3JlIHBo
b25lIG51bWJlDQogcnM6IGh0dHBzOi8vdGVsLm1lZXQvd25xLWFhb3MteGR2P3Bpbj0zMTkwNDEy
Mzk0NzgwJmhzPTdcblxuTGVhcm4gbW9yZSBhYm91DQogdCBNZWV0IGF0OiBodHRwczovL3N1cHBv
cnQuZ29vZ2xlLmNvbS9hL3VzZXJzL2Fuc3dlci85MjgyNzIwXG5cblBsZWFzZSBkbyBuDQogb3Qg
ZWRpdCB0aGlzIHNlY3Rpb24uXG4tOjp+On46On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46DQogfjp+On46fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi0NCkxB
U1QtTU9ESUZJRUQ6MjAyMzA2MjNUMjEwMTA5Wg0KTE9DQVRJT046T21uaSBSaWNobW9uZCBIb3Rl
bFwsIDEwMCBTIDEydGggU3RcLCBSaWNobW9uZFwsIFZBIDIzMjE5XCwgVVNBDQpTRVFVRU5DRTox
DQpTVEFUVVM6Q09ORklSTUVEDQpTVU1NQVJZOkNCTCBtZWV0dXANClRSQU5TUDpUUkFOU1BBUkVO
VA0KQkVHSU46VkFMQVJNDQpBQ1RJT046RElTUExBWQ0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBl
dmVudCByZW1pbmRlcg0KVFJJR0dFUjotUDFEDQpFTkQ6VkFMQVJNDQpCRUdJTjpWQUxBUk0NCkFD
VElPTjpESVNQTEFZDQpERVNDUklQVElPTjpUaGlzIGlzIGFuIGV2ZW50IHJlbWluZGVyDQpUUklH
R0VSOi1QN0QNCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==
--000000000000f18b2e05fed24c19--
