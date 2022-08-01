Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8397F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 18:57:18 +0000 (UTC)
Received: by mail-il1-f201.google.com with SMTP id m7-20020a056e021c2700b002ddc7d2d529so7199181ilh.9
        for <llvm@lists.linux.dev>; Mon, 01 Aug 2022 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:reply-to:sender:message-id:date:subject:from:to;
        bh=aEjpSgWihR+mbtSWzsCMunNqxe0H+j3jbWKhsFiz0L8=;
        b=asWxlrhsjt5Schdu1vUby6yhUVkM+xQp1lqgJke/O0b1OSjts5vWMCgb9rXtDKB+lp
         JCaADITSjX50Wyl2/UmrDdq5DhEf355W73GAPMtub/tn/XrlRZKlQN2uV2M35s1/cyip
         3wgh2LVWNSiYa1Ir7t3cS80Js/FMW2QnJJJjMh2I4Ih1nCsdpdBvmNjI37nPZnOWiNOd
         7oSjaVhpbXB+waA/imOOPpwN0aCjZuiJa6R3UY/SdgFdasWYy/c+I0WwCFwHZ2pQ5cGy
         oErmUzO2c9wAKQHTuDIQaap+Q6/CCKA8H+Luo87Jdc43aDgGNTGp8ymw+/iSa6expRN9
         5Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
         :subject:from:to;
        bh=aEjpSgWihR+mbtSWzsCMunNqxe0H+j3jbWKhsFiz0L8=;
        b=f2gFgQCCxnEne6ScXgc9KLOO/H5zBDVGt19lUlcY77s4Ep7u7LwDZWwmtMl3KLKtRt
         6kw0Hrb7iRrCxDpcT+EjHkx0+baNXHJyaPjWGUbgYmtLHHz7YD78hBRIsJ0NTmfa8byM
         3kH3CpFf8iwe3BssGsZAWV+7FkcLboCpoy10qJ0u8bUX4KgXKrUTYtfOaXZUrD27nDaB
         kbP8+zTT01jSld4DXCdPKClAQsXH3FB4IS+DXcedYkVa3bZ3Hs/37W1fRUqWLJdIUoQT
         vnpA9seotZ0OXZsKPyAndXsttE/JK10u/9dcWZWALLlKz1Y05h2Ss5sxDaqzYriKXBVD
         NIlA==
X-Gm-Message-State: AJIora/SIaF6AbIuk+/aUFwlfHvJSTGIKcIQ3LrUBZOqW2pNsYV0fUMJ
	SM0qmHN/0SvA9svGzLzUoBQCF9hGlGNsdKmcGXaRKgS3n1RaPQCVmb3S4x68KcXFAP5jl5kRP1V
	Uv1OHIfVXJw4MkWo8IIq53BxRebSY1L6uOzhSc+HgCWeIc7hkIyYXq01DwsEB+G9z3OpHpU9GYH
	Cnc0k=
X-Google-Smtp-Source: AGRyM1uJacIe6W2/x+OgJ+WBBZ7R5gUzl9nmKFCM+sihjSClFUMJC7iIU94vm2JSPKkL3p+9BFMLO/2o2caF36VJYz89
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1688:b0:2dd:973d:8d01 with SMTP id
 f8-20020a056e02168800b002dd973d8d01mr7005076ila.267.1659380237631; Mon, 01
 Aug 2022 11:57:17 -0700 (PDT)
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <0000000000009cd35405e53291ff@google.com>
Date: Mon, 01 Aug 2022 18:57:17 +0000
Subject: Invitation: Justin Stitt's Intern Presentation @ Wed Aug 17, 2022
 10am - 11am (PDT) (llvm@lists.linux.dev)
From: Nick Desaulniers <ndesaulniers@google.com>
To: llvm@lists.linux.dev, gosst-kernel <gosst-kernel@google.com>, 
	android-llvm-dev <android-llvm-dev@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>, natechancellor@gmail.com, 
	Clang Built Linux <clang-built-linux@googlegroups.com>
Content-Type: multipart/mixed; boundary="0000000000009cd33d05e53291fe"

--0000000000009cd33d05e53291fe
Content-Type: multipart/alternative; boundary="0000000000009cd33c05e53291fc"

--0000000000009cd33c05e53291fc
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

SnVzdGluIFN0aXR0J3MgSW50ZXJuIFByZXNlbnRhdGlvbg0KV2VkbmVzZGF5IEF1ZyAxNywgMjAy
MiDii4UgMTBhbSDigJMgMTFhbQ0KUGFjaWZpYyBUaW1lIC0gTG9zIEFuZ2VsZXMNCg0KSm9pbiB3
aXRoIEdvb2dsZSBNZWV0DQpodHRwczovL21lZXQuZ29vZ2xlLmNvbS93dHMtdml1cC1iYnU/aHM9
MjI0DQoNCg0KCQ0KSm9pbiBieSBwaG9uZQ0KKFVTKSArMSAyNTMtMjg5LTY5ODINClBJTjogNTI2
MzA1MjYxNjkNCg0KTW9yZSBwaG9uZSBudW1iZXJzDQpodHRwczovL3RlbC5tZWV0L3d0cy12aXVw
LWJidT9waW49NDc4MjAwNDI2ODM1OCZocz0wDQoNCg0KSm9pbiB1cyBmb3IgSnVzdGluJ3MgSW50
ZXJuIHByZXNlbnRhdGlvbiBhYm91dCB3b3JrIGhlIGRpZCBvdmVyIHRoZSBzdW1tZXIgIA0KcmVn
YXJkaW5nIGdldHRpbmcgLVdmb3JtYXQgZW5hYmxlZCBpbiB0aGUgTGludXgga2VybmVsIGZvciBD
bGFuZywgYW5kICANCnByb2ZpbGluZy9wZXJmb3JtYW5jZSB3b3JrIG9uIGJ1aWxkaW5nIHRoZSBM
aW51eCBrZXJuZWwgZmFzdGVyIHdpdGggQ2xhbmcuDQoNCk9yZ2FuaXplcg0KTmljayBEZXNhdWxu
aWVycw0KbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20NCg0KR3Vlc3RzDQpOaWNrIERlc2F1bG5pZXJz
IC0gb3JnYW5pemVyDQpnb3NzdC1rZXJuZWwNCmFuZHJvaWQtbGx2bS1kZXYNCmFuZHJvaWQta2Vy
bmVsLXRlYW0NCmtlcm5lbC1keW5hbWljLXRvb2xzDQpuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20N
CkNsYW5nIEJ1aWx0IExpbnV4DQpsbHZtQGxpc3RzLmxpbnV4LmRldg0KVmlldyBhbGwgZ3Vlc3Qg
aW5mbyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9u
PVZJRVcmZWlkPU5HVm9ZV0V5T1dreGFuRXdZalUxY25Rek5uSnNObTVzT0dnZ2JHeDJiVUJzYVhO
MGN5NXNhVzUxZUM1a1pYWSZ0b2s9TWpNamJtUmxjMkYxYkc1cFpYSnpRR2R2YjJkc1pTNWpiMjA0
WmpRd016QTRaRGd6TVdOa01qTTRNekJqTXpSak5EZzBZbUl4T1dRMFl6UmtNbVJsTW1NeCZjdHo9
QW1lcmljYSUyRkxvc19BbmdlbGVzJmhsPWVuJmVzPTANCg0KUmVwbHkgZm9yIGxsdm1AbGlzdHMu
bGludXguZGV2IGFuZCB2aWV3IG1vcmUgZGV0YWlscyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2ds
ZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU5HVm9ZV0V5T1dreGFuRXdZalUx
Y25Rek5uSnNObTVzT0dnZ2JHeDJiVUJzYVhOMGN5NXNhVzUxZUM1a1pYWSZ0b2s9TWpNamJtUmxj
MkYxYkc1cFpYSnpRR2R2YjJkc1pTNWpiMjA0WmpRd016QTRaRGd6TVdOa01qTTRNekJqTXpSak5E
ZzBZbUl4T1dRMFl6UmtNbVJsTW1NeCZjdHo9QW1lcmljYSUyRkxvc19BbmdlbGVzJmhsPWVuJmVz
PTANCllvdXIgYXR0ZW5kYW5jZSBpcyBvcHRpb25hbC4NCg0Kfn4vL35+DQpJbnZpdGF0aW9uIGZy
b20gR29vZ2xlIENhbGVuZGFyOiBodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIv
DQoNCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgZW1haWwgYmVjYXVzZSB5b3UgYXJlIGFuIGF0dGVu
ZGVlIG9uIHRoZSBldmVudC4gVG8gIA0Kc3RvcCByZWNlaXZpbmcgZnV0dXJlIHVwZGF0ZXMgZm9y
IHRoaXMgZXZlbnQsIGRlY2xpbmUgdGhpcyBldmVudC4NCg0KRm9yd2FyZGluZyB0aGlzIGludml0
YXRpb24gY291bGQgYWxsb3cgYW55IHJlY2lwaWVudCB0byBzZW5kIGEgcmVzcG9uc2UgdG8gIA0K
dGhlIG9yZ2FuaXplciwgYmUgYWRkZWQgdG8gdGhlIGd1ZXN0IGxpc3QsIGludml0ZSBvdGhlcnMg
cmVnYXJkbGVzcyBvZiAgDQp0aGVpciBvd24gaW52aXRhdGlvbiBzdGF0dXMsIG9yIG1vZGlmeSB5
b3VyIFJTVlAuDQoNCkxlYXJuIG1vcmUgaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2FsZW5k
YXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--0000000000009cd33c05e53291fc
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
  src: url(//fonts.gstatic.com/s/materialiconsextended/v144/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v118/Gw6kwdfw6UnXLJCcm=
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
ndar" content=3D"4ehaa29i1jq0b55rt36rl6nl8h"/><span style=3D"display: none;=
 font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; w=
idth: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">Jus=
tin Stitt&#39;s Intern Presentation</span><meta itemprop=3D"url" content=3D=
"https://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNGVoYWE=
yOWkxanEwYjU1cnQzNnJsNm5sOGggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRl=
c2F1bG5pZXJzQGdvb2dsZS5jb204ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmR=
lMmMx&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0"/><span aria-h=
idden=3D"true"><time itemprop=3D"startDate" datetime=3D"20220817T170000Z"><=
/time><time itemprop=3D"endDate" datetime=3D"20220817T180000Z"></time></spa=
n><div style=3D"display: none; font-size: 1px; color: #fff; line-height: 1p=
x; height: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; overflow: =
hidden;">Join with Google Meet =E2=80=93 Join us for Justin&#39;s Intern pr=
esentation about work he did over the summer regarding getting -Wformat ena=
bled in the Linux kernel for Clang, and profiling/performance work on build=
ing the Linux kernel</div><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%;" class=
=3D"body-container"><tbody><tr><td style=3D"" class=3D"" align=3D"left"><!-=
-[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation"><tr><td height=3D"16" style=3D"height:16px;"><![endif]-->=
<div style=3D"height:16px;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso =
| IE]></td></tr></table><![endif]--><table border=3D"0" cellpadding=3D"0" c=
ellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%=
;" class=3D""><tbody><tr><td style=3D"border: solid 1px #dadce0; border-rad=
ius: 8px; direction: rtl; font-size: 0; padding: 24px 32px; text-align: lef=
t; vertical-align: top;" class=3D"main-container-inner"><!--[if mso | IE]><=
table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation=
"><tr><![endif]--><!--[if mso | IE]><td class=3D"" style=3D"vertical-align:=
top;width:37%;" ><![endif]--><div class=3D"column-per-37 outlook-group-fix"=
 style=3D"font-size: 13px; text-align: left; direction: ltr; display: inlin=
e-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap: brea=
k-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" width=3D"100%"><tbody><tr><td style=3D"vertical-align:top;paddi=
ng:0;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation" width=3D"100%"><tr><td style=3D"font-size: 0; padding: 0; text-al=
ign: left; word-break: break-word;;padding-bottom:28px;"><a href=3D"https:/=
/meet.google.com/wts-viup-bbu?hs=3D224" class=3D"primary-button-text" style=
=3D"display: inline-block;font-family: &#39;Google Sans&#39;, Roboto, sans-=
serif;font-size: 14px; letter-spacing: 0.25px; line-height: 20px; mso-line-=
height-rule: exactly; text-decoration: none; text-transform: none; word-wra=
p: break-word; white-space: nowrap;color: #fff;font-weight: 700;white-space=
: normal;" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"presentati=
on" valign=3D"middle" style=3D"background-color: #1a73e8; cursor: auto; pad=
ding: 10px 25px; border: none; border-radius: 4px; margin: 0;" class=3D"pri=
mary-button"><span class=3D"primary-button-text" style=3D"font-family: &#39=
;Google Sans&#39;, Roboto, sans-serif;font-size: 14px; letter-spacing: 0.25=
px; line-height: 20px; mso-line-height-rule: exactly; text-decoration: none=
; text-transform: none; word-wrap: break-word; white-space: nowrap;color: #=
fff;font-weight: 700;white-space: normal;">Join with Google Meet</span></td=
></tr></table></a></td></tr><tr><td style=3D"font-size: 0; padding: 0; text=
-align: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"f=
ont-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line=
-height-rule: exactly; text-align: left;"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px=
;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c40=
43; text-decoration: none;font-weight: 700;-webkit-font-smoothing: antialia=
sed;margin: 0; padding: 0;">Meeting link</h2></td></tr></table><!-- Use gre=
y text for the Meet link--><div><a style=3D"display: inline-block;;color: #=
70757a; text-decoration: none;" class=3D"secondary-text underline-on-hover"=
 href=3D"https://meet.google.com/wts-viup-bbu?hs=3D224">meet.google.com/wts=
-viup-bbu</a></div></div></td></tr><tr><td style=3D"font-size: 0; padding: =
0; text-align: left; word-break: break-word;;padding-bottom:24px;"><div sty=
le=3D"font-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; m=
so-line-height-rule: exactly; text-align: left;"><table border=3D"0" cellpa=
dding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom=
: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: =
#3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoothing: ant=
ialiased;margin: 0; padding: 0;">Join by phone</h2></td></tr></table><span =
class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;;">=
(US) </span><a href=3D"tel:+1-253-289-6982%3B52630526169%23" style=3D"displ=
ay: inline-block;color: #1a73e8; text-decoration: none;" target=3D"_blank" =
class=3D"accent-text underline-on-hover">+1 253-289-6982</a> <br><span clas=
s=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;;">PIN:=
 52630526169</span><br><br><a href=3D"https://tel.meet/wts-viup-bbu?pin=3D4=
782004268358&amp;hs=3D0" style=3D"display: inline-block;color: #1a73e8; tex=
t-decoration: none;" target=3D"_blank" class=3D"accent-text underline-on-ho=
ver">More phone numbers</a><br></div></td></tr></table></td></tr></tbody></=
table></div><!--[if mso | IE]></td><![endif]--><!--[if mso | IE]><td class=
=3D"" style=3D"vertical-align:top;width:63%;padding-right:32px;" ><![endif]=
--><div class=3D"column-per-63 outlook-group-fix" style=3D"font-size: 13px;=
 text-align: left; direction: ltr; display: inline-block; vertical-align: t=
op; width: 100%;overflow: hidden; word-wrap: break-word;"><table border=3D"=
0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%"=
 class=3D"main-column-table-ltr" style=3D"padding-right: 32px; padding-left=
: 0;;table-layout: fixed;"><tbody><tr><td class=3D"main-column-td" style=3D=
"padding:0; vertical-align:top;"><table border=3D"0" cellpadding=3D"0" cell=
spacing=3D"0" role=3D"presentation" width=3D"100%" style=3D"table-layout: f=
ixed;"><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-br=
eak: break-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, s=
ans-serif;font-style: normal; font-weight: 400; font-size: 14px; line-heigh=
t: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" clas=
s=3D"primary-text" role=3D"presentation"><span>Join us for Justin's Intern =
presentation about work he did over the summer regarding getting -Wformat e=
nabled in the Linux kernel for Clang, and profiling/performance work on bui=
lding the Linux kernel faster with Clang.</span><meta itemprop=3D"descripti=
on" content=3D"Join us for Justin&#39;s Intern presentation about work he d=
id over the summer regarding getting -Wformat enabled in the Linux kernel f=
or Clang, and profiling/performance work on building the Linux kernel faste=
r with Clang."/></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; =
text-align: left; word-break: break-word;;padding-bottom:24px;"><div style=
=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight: 400; f=
ont-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; te=
xt-decoration: none;" class=3D"primary-text" role=3D"presentation"><span ar=
ia-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20220817T170000=
Z"></time><time itemprop=3D"endDate" datetime=3D"20220817T180000Z"></time><=
/span><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" =
style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight:=
 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">When</h2><=
/td></tr></table><span>Wednesday Aug 17, 2022 =E2=8B=85 10am =E2=80=93 11am=
 (Pacific Time - Los Angeles)</span></div></td></tr><tr><td style=3D"font-s=
ize: 0; padding: 0; text-align: left; word-break: break-word;;padding-botto=
m:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; =
font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px=
;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"pre=
sentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"=
presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-t=
ext" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-we=
ight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Guest=
s</h2></td></tr></table><div style=3D"padding-bottom: 4px; text-align: left=
;;color: #3c4042;"><div><span itemprop=3D"attendee" itemscope itemtype=3D"h=
ttp://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a c=
lass=3D"primary-text underline-on-hover" style=3D"display: inline-block;;co=
lor: #3c4043; text-decoration: none;" href=3D"mailto:ndesaulniers@google.co=
m">Nick Desaulniers</a></span><meta itemprop=3D"email" content=3D"ndesaulni=
ers@google.com"/></span><span itemprop=3D"organizer" itemscope itemtype=3D"=
http://schema.org/Person"><meta itemprop=3D"name" content=3D"Nick Desaulnie=
rs"/><meta itemprop=3D"email" content=3D"ndesaulniers@google.com"/></span><=
span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: non=
e;"> - organizer</span></div><div><span itemprop=3D"attendee" itemscope ite=
mtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notrans=
late"><a class=3D"primary-text underline-on-hover" style=3D"display: inline=
-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:gosst-kernel=
@google.com">gosst-kernel</a></span><meta itemprop=3D"email" content=3D"gos=
st-kernel@google.com"/></span><span class=3D"secondary-text" style=3D"color=
: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:android-llvm-dev@google.com">android-llvm-dev</a></span><meta itempr=
op=3D"email" content=3D"android-llvm-dev@google.com"/></span><span class=3D=
"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span></=
div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.or=
g/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary=
-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043; t=
ext-decoration: none;" href=3D"mailto:android-kernel-team@google.com">andro=
id-kernel-team</a></span><meta itemprop=3D"email" content=3D"android-kernel=
-team@google.com"/></span><span class=3D"secondary-text" style=3D"color: #7=
0757a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee=
" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" c=
lass=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"=
display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mail=
to:kernel-dynamic-tools@google.com">kernel-dynamic-tools</a></span><meta it=
emprop=3D"email" content=3D"kernel-dynamic-tools@google.com"/></span><span =
class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"><=
/span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://s=
chema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D=
"primary-text underline-on-hover" style=3D"display: inline-block;;color: #3=
c4043; text-decoration: none;" href=3D"mailto:natechancellor@gmail.com">nat=
echancellor@gmail.com</a></span><meta itemprop=3D"email" content=3D"natecha=
ncellor@gmail.com"/></span><span class=3D"secondary-text" style=3D"color: #=
70757a; text-decoration: none;"></span></div><div><span itemprop=3D"attende=
e" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" =
class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D=
"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mai=
lto:clang-built-linux@googlegroups.com">Clang Built Linux</a></span><meta i=
temprop=3D"email" content=3D"clang-built-linux@googlegroups.com"/></span><s=
pan class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none=
;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http=
://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a clas=
s=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color=
: #3c4043; text-decoration: none;" href=3D"mailto:llvm@lists.linux.dev">llv=
m@lists.linux.dev</a></span><meta itemprop=3D"email" content=3D"llvm@lists.=
linux.dev"/></span><span class=3D"secondary-text" style=3D"color: #70757a; =
text-decoration: none;"></span></div></div><a href=3D"https://calendar.goog=
le.com/calendar/event?action=3DVIEW&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsN=
m5sOGggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS=
5jb204ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;col=
or: #1a73e8; text-decoration: none;font-weight: 700;" target=3D"_blank" cla=
ss=3D"accent-text underline-on-hover">View all guest info</a></div></td></t=
r><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: =
break-word;;padding-bottom:0px;"><div style=3D"color: #3c4043; text-decorat=
ion: none;;font-family: Roboto, sans-serif;font-size: 14px; line-height: 20=
px; mso-line-height-rule: exactly; text-align: left;" class=3D"primary-text=
"><div><span style=3D"font-weight: 700;-webkit-font-smoothing: antialiased;=
">Reply</span><span class=3D"secondary-text" style=3D"color: #70757a; text-=
decoration: none;"> for <a class=3D"secondary-text underline-on-hover" styl=
e=3D"display: inline-block;;color: #70757a; text-decoration: none;" href=3D=
"mailto:llvm@lists.linux.dev">llvm@lists.linux.dev</a></span></div></div></=
td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-b=
reak: break-word;;padding-bottom:16px;"><div style=3D"font-family: Roboto, =
sans-serif;font-size: 14px; line-height: 20px; mso-line-height-rule: exactl=
y; text-align: left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"=
0" role=3D"presentation" style=3D"border-collapse: separate;"><tr><td style=
=3D"padding-top: 8px; padding-left: 0; padding-right: 12px;"><!-- RSVP butt=
ons --><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation" style=3D"border: solid 1px #dadce0; border-radius: 16px; border-c=
ollapse: separate;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;;d=
isplay: inline-block;;margin-right: 12px; margin-left: 0;"><tr><td align=3D=
"center" vertical-align=3D"middle" role=3D"presentation"><span itemprop=3D"=
potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta =
itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Yes"/><=
span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActio=
nHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMe=
thod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.goog=
le.com/calendar/event?action=3DRESPOND&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNn=
JsNm5sOGggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D1&amp;tok=3DMjMjbmRlc2F1bG5=
pZXJzQGdvb2dsZS5jb204ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&a=
mp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight=
: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368=
; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin=
: 0; text-decoration: none; text-transform: none;" class=3D"grey-button-tex=
t" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"p=
resentation" valign=3D"middle" style=3D"padding: 6px 0; padding-left: 16px;=
 padding-right: 12px; white-space: nowrap;"><span class=3D"grey-button-text=
" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, san=
s-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height=
-rule: exactly; margin: 0; text-decoration: none; text-transform: none;">Ye=
s</span></td></tr></table></a></span></span></span></td><td align=3D"center=
" vertical-align=3D"middle" role=3D"presentation" style=3D"border-left: sol=
id 1px #dadce0; border-right: solid 1px #dadce0;"><span itemprop=3D"potenti=
alaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itempro=
p=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"/><span ite=
mprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler=
"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET=
"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.google.com/c=
alendar/event?action=3DRESPOND&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsNm5sOG=
ggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D2&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGd=
vb2dsZS5jb204ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=
=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;=
font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font=
-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; t=
ext-decoration: none; text-transform: none;" class=3D"grey-button-text" ite=
mprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cells=
pacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"present=
ation" valign=3D"middle" style=3D"padding: 6px 12px; white-space: nowrap;">=
<span class=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#3=
9;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; lin=
e-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: =
none; text-transform: none;">No</span></td></tr></table></a></span></span><=
/span></td><td align=3D"center" vertical-align=3D"middle" role=3D"presentat=
ion"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema=
.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org=
/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"ht=
tp://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http:/=
/schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=
=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DN=
GVoYWEyOWkxanEwYjU1cnQzNnJsNm5sOGggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D3&=
amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb204ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjN=
Dg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=
=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto,=
 sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-he=
ight-rule: exactly; margin: 0; text-decoration: none; text-transform: none;=
" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table bord=
er=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td =
align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padding: =
6px 0; padding-left: 12px; padding-right: 16px; white-space: nowrap;"><span=
 class=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Goo=
gle Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-hei=
ght: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none;=
 text-transform: none;">Maybe</span></td></tr></table></a></span></span></s=
pan></td></tr></table><!-- More options --><a href=3D"https://calendar.goog=
le.com/calendar/event?action=3DVIEW&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsN=
m5sOGggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS=
5jb204ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;fon=
t-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color:=
 #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly=
; margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-bu=
tton-text" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-=
radius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;,=
 Roboto, sans-serif;"><tr><td align=3D"center" vertical-align=3D"middle" ro=
le=3D"presentation" style=3D"padding: 6px 0; padding-left: 16px; padding-ri=
ght: 12px; white-space: nowrap;;color: #5f6367;"><span class=3D"grey-button=
-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto=
, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-h=
eight-rule: exactly; margin: 0; text-decoration: none; text-transform: none=
;">More options</span></td></tr></table></a></td></tr></table></div></td></=
tr></table></td></tr></tbody></table></div><!--[if mso | IE]></td><![endif]=
--><!--[if mso | IE]></tr></table><![endif]--></td></tr></tbody></table><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" =
align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"f=
ont-size: 0; padding: 0; text-align: left; word-break: break-word;;padding:=
4px 12px;" class=3D"" align=3D"left"><div class=3D"secondary-text" style=3D=
"color: #70757a; text-decoration: none;font-family: Roboto, sans-serif;font=
-size: 12px; line-height: 16px; mso-line-height-rule: exactly; text-align: =
left;"><p>Invitation from <a href=3D"https://calendar.google.com/calendar/"=
 class=3D"accent-text underline-on-hover" style=3D"font-family: Roboto, san=
s-serif;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly;;=
color: #1a73e8; text-decoration: none;" target=3D"_blank">Google Calendar</=
a></p><p>You are receiving this email because you are an attendee on the ev=
ent. To stop receiving future updates for this event, decline this event.</=
p><p>Forwarding this invitation could allow any recipient to send a respons=
e to the organizer, be added to the guest list, invite others regardless of=
 their own invitation status, or modify your RSVP. <a class=3D"accent-text =
underline-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12p=
x; line-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-d=
ecoration: none;" href=3D"https://support.google.com/calendar/answer/37135#=
forwarding">Learn more</a></p></div></td></tr></tbody></table></td></tr></t=
body></table></span></span></body></html>
--0000000000009cd33c05e53291fc
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20220817T170000Z
DTEND:20220817T180000Z
DTSTAMP:20220801T185717Z
ORGANIZER;CN=Nick Desaulniers:mailto:ndesaulniers@google.com
UID:4ehaa29i1jq0b55rt36rl6nl8h@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=gosst-kernel;X-NUM-GUESTS=0:mailto:gosst-kernel@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=Nick Desaulniers;X-NUM-GUESTS=0:mailto:ndesaulniers@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=android-llvm-dev;X-NUM-GUESTS=0:mailto:android-llvm-dev@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=android-kernel-team;X-NUM-GUESTS=0:mailto:android-kernel-team@googl
 e.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=kernel-dynamic-tools;X-NUM-GUESTS=0:mailto:kernel-dynamic-tools@goo
 gle.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=natechancellor@gmail.com;X-NUM-GUESTS=0:mailto:natechancellor@gmail
 .com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Clang Built Linux;X-NUM-GUESTS=0:mailto:clang-built-linux@googlegro
 ups.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=llvm@lists.linux.dev;X-NUM-GUESTS=0:mailto:llvm@lists.linux.dev
X-GOOGLE-CONFERENCE:https://meet.google.com/wts-viup-bbu
X-MICROSOFT-CDO-OWNERAPPTID:-796859524
CREATED:20220801T185710Z
DESCRIPTION:Join us for Justin's Intern presentation about work he did over
  the summer regarding getting -Wformat enabled in the Linux kernel for Clan
 g\, and profiling/performance work on building the Linux kernel faster with
  Clang.\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~::~:~::-\nDo not edit this section of the description.\n\nTh
 is event has a video call.\nJoin: https://meet.google.com/wts-viup-bbu\n(US
 ) +1 253-289-6982 PIN: 52630526169#\nView more phone numbers: https://tel.m
 eet/wts-viup-bbu?pin=4782004268358&hs=7\n\nView your event at https://calen
 dar.google.com/calendar/event?action=VIEW&eid=NGVoYWEyOWkxanEwYjU1cnQzNnJsN
 m5sOGggbGx2bUBsaXN0cy5saW51eC5kZXY&tok=MjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb204
 ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&ctz=America%2FLos_Ange
 les&hl=en&es=1.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20220801T185714Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:Justin Stitt's Intern Presentation
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000009cd33c05e53291fc--
--0000000000009cd33d05e53291fe
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjIwODE3VDE3MDAwMFoNCkRURU5EOjIwMjIwODE3
VDE4MDAwMFoNCkRUU1RBTVA6MjAyMjA4MDFUMTg1NzE3Wg0KT1JHQU5JWkVSO0NOPU5pY2sgRGVz
YXVsbmllcnM6bWFpbHRvOm5kZXNhdWxuaWVyc0Bnb29nbGUuY29tDQpVSUQ6NGVoYWEyOWkxanEw
YjU1cnQzNnJsNm5sOGhAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9M
RT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1n
b3NzdC1rZXJuZWw7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmdvc3N0LWtlcm5lbEBnb29nbGUuY29t
DQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RB
VD1BQ0NFUFRFRDtSU1ZQPVRSVUUNCiA7Q049TmljayBEZXNhdWxuaWVycztYLU5VTS1HVUVTVFM9
MDptYWlsdG86bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklE
VUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRS
VUU7Q049YW5kcm9pZC1sbHZtLWRldjtYLU5VTS1HVUVTVFM9MDptYWlsdG86YW5kcm9pZC1sbHZt
LWRldkBnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPWFuZHJvaWQta2Vy
bmVsLXRlYW07WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmFuZHJvaWQta2VybmVsLXRlYW1AZ29vZ2wN
CiBlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1rZXJuZWwtZHluYW1pYy10b29s
cztYLU5VTS1HVUVTVFM9MDptYWlsdG86a2VybmVsLWR5bmFtaWMtdG9vbHNAZ29vDQogZ2xlLmNv
bQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNU
QVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1uYXRlY2hhbmNlbGxvckBnbWFpbC5jb207
WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm5hdGVjaGFuY2VsbG9yQGdtYWlsDQogLmNvbQ0KQVRURU5E
RUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMt
QUNUSU9OO1JTVlA9DQogVFJVRTtDTj1DbGFuZyBCdWlsdCBMaW51eDtYLU5VTS1HVUVTVFM9MDpt
YWlsdG86Y2xhbmctYnVpbHQtbGludXhAZ29vZ2xlZ3JvDQogdXBzLmNvbQ0KQVRURU5ERUU7Q1VU
WVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9DQogVFJVRTtDTj1sbHZtQGxpc3RzLmxpbnV4LmRldjtYLU5VTS1HVUVTVFM9MDptYWls
dG86bGx2bUBsaXN0cy5saW51eC5kZXYNClgtR09PR0xFLUNPTkZFUkVOQ0U6aHR0cHM6Ly9tZWV0
Lmdvb2dsZS5jb20vd3RzLXZpdXAtYmJ1DQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBUSUQ6LTc5
Njg1OTUyNA0KQ1JFQVRFRDoyMDIyMDgwMVQxODU3MTBaDQpERVNDUklQVElPTjpKb2luIHVzIGZv
ciBKdXN0aW4ncyBJbnRlcm4gcHJlc2VudGF0aW9uIGFib3V0IHdvcmsgaGUgZGlkIG92ZXINCiAg
dGhlIHN1bW1lciByZWdhcmRpbmcgZ2V0dGluZyAtV2Zvcm1hdCBlbmFibGVkIGluIHRoZSBMaW51
eCBrZXJuZWwgZm9yIENsYW4NCiBnXCwgYW5kIHByb2ZpbGluZy9wZXJmb3JtYW5jZSB3b3JrIG9u
IGJ1aWxkaW5nIHRoZSBMaW51eCBrZXJuZWwgZmFzdGVyIHdpdGgNCiAgQ2xhbmcuXG5cbi06On46
fjo6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjoNCiB+On46fjp+On46fjp+On46On46fjo6LVxuRG8gbm90IGVkaXQgdGhpcyBzZWN0aW9uIG9m
IHRoZSBkZXNjcmlwdGlvbi5cblxuVGgNCiBpcyBldmVudCBoYXMgYSB2aWRlbyBjYWxsLlxuSm9p
bjogaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vd3RzLXZpdXAtYmJ1XG4oVVMNCiApICsxIDI1My0y
ODktNjk4MiBQSU46IDUyNjMwNTI2MTY5I1xuVmlldyBtb3JlIHBob25lIG51bWJlcnM6IGh0dHBz
Oi8vdGVsLm0NCiBlZXQvd3RzLXZpdXAtYmJ1P3Bpbj00NzgyMDA0MjY4MzU4JmhzPTdcblxuVmll
dyB5b3VyIGV2ZW50IGF0IGh0dHBzOi8vY2FsZW4NCiBkYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9l
dmVudD9hY3Rpb249VklFVyZlaWQ9TkdWb1lXRXlPV2t4YW5Fd1lqVTFjblF6Tm5Kc04NCiBtNXNP
R2dnYkd4MmJVQnNhWE4wY3k1c2FXNTFlQzVrWlhZJnRvaz1Nak1qYm1SbGMyRjFiRzVwWlhKelFH
ZHZiMmRzWlM1amIyMDQNCiBaalF3TXpBNFpEZ3pNV05rTWpNNE16QmpNelJqTkRnMFltSXhPV1Ew
WXpSa01tUmxNbU14JmN0ej1BbWVyaWNhJTJGTG9zX0FuZ2UNCiBsZXMmaGw9ZW4mZXM9MS5cbi06
On46fjo6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjoN
CiB+On46fjp+On46fjp+On46fjp+On46On46fjo6LQ0KTEFTVC1NT0RJRklFRDoyMDIyMDgwMVQx
ODU3MTRaDQpMT0NBVElPTjoNClNFUVVFTkNFOjANClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6
SnVzdGluIFN0aXR0J3MgSW50ZXJuIFByZXNlbnRhdGlvbg0KVFJBTlNQOk9QQVFVRQ0KRU5EOlZF
VkVOVA0KRU5EOlZDQUxFTkRBUg0K
--0000000000009cd33d05e53291fe--
