Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AE7321D
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 19:44:50 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-32a8e40e2dcso17265077b3.23
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
         :mime-version:from:to:cc;
        bh=Vi9zUUm6NhffYvdUZlmLhCXj2dA9JpoO4vhhbIZfYzM=;
        b=PHMqpKrR9/b86TPP/qPMViTP29JoDX3FAVmOOsABCh0apb0+h31i/3L256f2cQMj4f
         PeN7lKwgc3ulGcFPkLAJ4D+f6ArKpzuQGmmsJDEdqvhl9Dpbr5f4GFVNfto/4ZvdagC0
         z2cP+odu2JViQrXMy99aNhnVar8Npgu3HmpSAPukn7sRM28Z9Bvgr1Fg6H0vJLiXc72F
         2Nz1yJdCOdfMIzU2hfd9Tj+ZeyOmhLN7NIBA4z3z54B8BBIjnsnm1U+blbw8scRc2PB6
         aUkTPfY9CoTXm9ldM1Ve2Xdavw2MUacGlm9kF2A4k4fqWv+h4eT7k2r+958KItDENcPR
         KvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Vi9zUUm6NhffYvdUZlmLhCXj2dA9JpoO4vhhbIZfYzM=;
        b=r51ZZDJML5jwV42pTw+pdQnC1c7YCdgSbvkZ8FoK/HyLcQRNCB8GE+m/opudGX7M9o
         HNmsEymL64nUlgvPhx4z+MFG/EdfvcPFNtDClHLXqatcn+XHMgtW+L3QhOijxx40wEDK
         Mz7pQnMrn/Z94YeqAj34XzFddzAeICJUWNLqN6CH9mB86w+9p7M6N2cfJcst+LO6wjQn
         VVwOJxgD1J8pZK31GsFJP/m9YHZ/ZaXJQ8u5J13A9lqSHl2t/bf5WS4R6O5kVcX+PLCq
         CDxnendgdNxMOiJ/e3H3tQrYDzQBR9Wiy59otee4JUDods4ywGlaUx7FN7z0Wp2ASYdz
         rPVw==
X-Gm-Message-State: ACgBeo1KMazGIGSeoM5SjGsERNZWhmD3gy5YdzVVvC/6aPxOyRv6nYfW
	wq/6naPsVpXOtoH47ufdxNXVq8Mja40V3nBIAbTMzINHKdDOYznQsfQrWLSHS3a2c5n45aH2Wzo
	GKeWCIL9xt5iULDwUl4AGKIreIiBzm9X5T7Cl5UVNT7VzO1YpMoAKOxivrd55z+wNzMBm1OuhZS
	py14U=
X-Google-Smtp-Source: AA6agR6BusHMOaapcTYHL+uPmtvZ00nv4VmwGDmRJ7gU1saD2hHXsheseSdu4NkCA2wJFp6G/IwubH0sVED+kBwWP17t
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a81:54c4:0:b0:329:d0e1:cfcf with SMTP id
 i187-20020a8154c4000000b00329d0e1cfcfmr14096490ywb.451.1660160689437; Wed, 10
 Aug 2022 12:44:49 -0700 (PDT)
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Sender: Google Calendar <calendar-notification@google.com>
Auto-Submitted: auto-generated
Message-ID: <0000000000002af1c805e5e8483d@google.com>
Date: Wed, 10 Aug 2022 19:44:49 +0000
Subject: Updated invitation: Justin Stitt's Intern Presentation @ Wed Aug 17,
 2022 10am - 11am (PDT) (llvm@lists.linux.dev)
From: Nick Desaulniers <ndesaulniers@google.com>
To: llvm@lists.linux.dev, gosst-kernel <gosst-kernel@google.com>, 
	android-llvm-dev <android-llvm-dev@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>, natechancellor@gmail.com, 
	Clang Built Linux <clang-built-linux@googlegroups.com>, 
	"Sedat Dilek (DHL Supply Chain)" <sedat.dilek@dhl.com>
Content-Type: multipart/mixed; boundary="0000000000002af19005e5e84839"

--0000000000002af19005e5e84839
Content-Type: multipart/alternative; boundary="0000000000002af18c05e5e84837"

--0000000000002af18c05e5e84837
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQpDaGFuZ2VkOiBsb2NhdGlvbg0KDQoNCkp1c3Rp
biBTdGl0dCdzIEludGVybiBQcmVzZW50YXRpb24NCldlZG5lc2RheSBBdWcgMTcsIDIwMjIg4ouF
IDEwYW0g4oCTIDExYW0NClBhY2lmaWMgVGltZSAtIExvcyBBbmdlbGVzDQoNCkxvY2F0aW9uDQpV
Sy1MT04tNlBTLTktQy1DYW1kZW4gVG93biAoTm8gRXh0ZXJuYWxzIEV4Y2VwdCBGb3IgSW50ZXJ2
aWV3cykgKDgpIFtHVkNdLCAgDQpVUy1OWUMtOVRILTExLUEtMjMyLUl0J3MgVG9vIENvbGQgKDcp
IFtHVkNdLCBVUy1NVFYtUExZTTE2MjUtNC1BLUFlc3RoZXRpY3MgIA0KKDcpIFtHVkMsIFBob25l
XSwgVVMtU0FOLTY0MjAtNC0zLU10LiBTb2xlZGFkICg1KSBbR1ZDXSwgIA0KVVMtU1ZMLUNSU00x
MjQwLTItUS1GZWlqb2FkYSAoNCkgW0dWQ10sIFVTLU1UVi0xNjY3LTEtTi1IZXkgSnVkZSAoOCkg
W0dWQywgIA0KUGhvbmVdLCBERS1NVUMtQVJONjAtRy0yLU9jaHNlbmJyYXRlcmVpICg3KSBbR1ZD
XSwgQ0gtWlJILUVVUkQtNi1BLVBydW50cnV0ICANCig1KSBbR1ZDXQkNCmh0dHBzOi8vd3d3Lmdv
b2dsZS5jb20vbWFwcy9zZWFyY2gvVUstTE9OLTZQUy05LUMtQ2FtZGVuK1Rvd24rKE5vK0V4dGVy
bmFscytFeGNlcHQrRm9yK0ludGVydmlld3MpKyg4KSslNUJHVkMlNUQsK1VTLU5ZQy05VEgtMTEt
QS0yMzItSXQncytUb28rQ29sZCsoNykrJTVCR1ZDJTVELCtVUy1NVFYtUExZTTE2MjUtNC1BLUFl
c3RoZXRpY3MrKDcpKyU1QkdWQywrUGhvbmUlNUQsK1VTLVNBTi02NDIwLTQtMy1NdC4rU29sZWRh
ZCsoNSkrJTVCR1ZDJTVELCtVUy1TVkwtQ1JTTTEyNDAtMi1RLUZlaWpvYWRhKyg0KSslNUJHVkMl
NUQsK1VTLU1UVi0xNjY3LTEtTi1IZXkrSnVkZSsoOCkrJTVCR1ZDLCtQaG9uZSU1RCwrREUtTVVD
LUFSTjYwLUctMi1PY2hzZW5icmF0ZXJlaSsoNykrJTVCR1ZDJTVELCtDSC1aUkgtRVVSRC02LUEt
UHJ1bnRydXQrKDUpKyU1QkdWQyU1RD9obD1lbg0KDQpKb2luIHdpdGggR29vZ2xlIE1lZXQNCmh0
dHBzOi8vbWVldC5nb29nbGUuY29tL3d0cy12aXVwLWJidT9ocz0yMjQNCg0KDQoJDQpKb2luIGJ5
IHBob25lDQooVVMpICsxIDI1My0yODktNjk4Mg0KUElOOiA1MjYzMDUyNjE2OQ0KDQpNb3JlIHBo
b25lIG51bWJlcnMNCmh0dHBzOi8vdGVsLm1lZXQvd3RzLXZpdXAtYmJ1P3Bpbj00NzgyMDA0MjY4
MzU4JmhzPTANCg0KDQpKb2luIHVzIGZvciBKdXN0aW4ncyBJbnRlcm4gcHJlc2VudGF0aW9uIGFi
b3V0IHdvcmsgaGUgZGlkIG92ZXIgdGhlIHN1bW1lciAgDQpyZWdhcmRpbmcgZ2V0dGluZyAtV2Zv
cm1hdCBlbmFibGVkIGluIHRoZSBMaW51eCBrZXJuZWwgZm9yIENsYW5nLCBhbmQgIA0KcHJvZmls
aW5nL3BlcmZvcm1hbmNlIHdvcmsgb24gYnVpbGRpbmcgdGhlIExpbnV4IGtlcm5lbCBmYXN0ZXIg
d2l0aCBDbGFuZy4NCg0KT3JnYW5pemVyDQpOaWNrIERlc2F1bG5pZXJzDQpuZGVzYXVsbmllcnNA
Z29vZ2xlLmNvbQ0KDQpHdWVzdHMNCk5pY2sgRGVzYXVsbmllcnMgLSBvcmdhbml6ZXINCmdvc3N0
LWtlcm5lbA0KYW5kcm9pZC1sbHZtLWRldg0KYW5kcm9pZC1rZXJuZWwtdGVhbQ0Ka2VybmVsLWR5
bmFtaWMtdG9vbHMNCm5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbQ0KQ2xhbmcgQnVpbHQgTGludXgN
Cmxsdm1AbGlzdHMubGludXguZGV2DQpTZWRhdCBEaWxlayAoREhMIFN1cHBseSBDaGFpbikNClZp
ZXcgYWxsIGd1ZXN0IGluZm8gIA0KaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFy
L2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1OR1ZvWVdFeU9Xa3hhbkV3WWpVMWNuUXpObkpzTm01c09H
Z2diR3gyYlVCc2FYTjBjeTVzYVc1MWVDNWtaWFkmdG9rPU1qTWpibVJsYzJGMWJHNXBaWEp6UUdk
dmIyZHNaUzVqYjIwNFpqUXdNekE0WkRnek1XTmtNak00TXpCak16UmpORGcwWW1JeE9XUTBZelJr
TW1SbE1tTXgmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZobD1lbiZlcz0wDQoNClJlcGx5IGZv
ciBsbHZtQGxpc3RzLmxpbnV4LmRldiBhbmQgdmlldyBtb3JlIGRldGFpbHMgIA0KaHR0cHM6Ly9j
YWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1OR1ZvWVdF
eU9Xa3hhbkV3WWpVMWNuUXpObkpzTm01c09HZ2diR3gyYlVCc2FYTjBjeTVzYVc1MWVDNWtaWFkm
dG9rPU1qTWpibVJsYzJGMWJHNXBaWEp6UUdkdmIyZHNaUzVqYjIwNFpqUXdNekE0WkRnek1XTmtN
ak00TXpCak16UmpORGcwWW1JeE9XUTBZelJrTW1SbE1tTXgmY3R6PUFtZXJpY2ElMkZMb3NfQW5n
ZWxlcyZobD1lbiZlcz0wDQpZb3VyIGF0dGVuZGFuY2UgaXMgb3B0aW9uYWwuDQoNCn5+Ly9+fg0K
SW52aXRhdGlvbiBmcm9tIEdvb2dsZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUu
Y29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91
IGFyZSBhbiBhdHRlbmRlZSBvbiB0aGUgZXZlbnQuIFRvICANCnN0b3AgcmVjZWl2aW5nIGZ1dHVy
ZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50LCBkZWNsaW5lIHRoaXMgZXZlbnQuDQoNCkZvcndhcmRp
bmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNpcGllbnQgdG8gc2VuZCBhIHJl
c3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIsIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBsaXN0LCBp
bnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0KdGhlaXIgb3duIGludml0YXRpb24gc3RhdHVz
LCBvciBtb2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFybiBtb3JlIGh0dHBzOi8vc3VwcG9ydC5nb29n
bGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJkaW5nDQo=
--0000000000002af18c05e5e84837
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
  src: url(//fonts.gstatic.com/s/materialiconsextended/v145/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v122/Gw6kwdfw6UnXLJCcm=
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
/InformAction"><span itemprop=3D"object" itemscope itemtype=3D"http://schem=
a.org/Event"><meta itemprop=3D"eventStatus" content=3D"http://schema.org/Ev=
entRescheduled"/><span itemprop=3D"publisher" itemscope itemtype=3D"http://=
schema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calendar=
"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"4ehaa29i1jq0=
b55rt36rl6nl8h"/><span style=3D"display: none; font-size: 1px; color: #fff;=
 line-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacit=
y: 0; overflow: hidden;" itemprop=3D"name">Justin Stitt&#39;s Intern Presen=
tation</span><meta itemprop=3D"url" content=3D"https://calendar.google.com/=
calendar/event?action=3DVIEW&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsNm5sOGgg=
bGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb204Z=
jQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmerica%2FLos=
_Angeles&amp;hl=3Den&amp;es=3D0"/><span aria-hidden=3D"true"><time itemprop=
=3D"startDate" datetime=3D"20220817T170000Z"></time><time itemprop=3D"endDa=
te" datetime=3D"20220817T180000Z"></time></span><div style=3D"display: none=
; font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; =
width: 0; max-width: 0; opacity: 0; overflow: hidden;">Join with Google Mee=
t =E2=80=93 Join us for Justin&#39;s Intern presentation about work he did =
over the summer regarding getting -Wformat enabled in the Linux kernel for =
Clang, and profiling/performance work on building the Linux kernel</div><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" =
align=3D"center" style=3D"width:100%;" class=3D"body-container"><tbody><tr>=
<td style=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><table border=3D=
"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td heigh=
t=3D"16" style=3D"height:16px;"><![endif]--><div style=3D"height:16px;" ari=
a-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endi=
f]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presen=
tation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td st=
yle=3D"background-color: #e6f4ea;color: #0d5327;padding: 12px 32px; border-=
radius: 8px;font-family: Roboto, sans-serif;font-size: 14px; line-height: 2=
0px;text-align: left;" class=3D"info-bar-inner"><span style=3D"font-weight:=
 700;">This event has been updated</span><br/><span style=3D"display:none" =
itemprop=3D"about" itemscope itemtype=3D"http://schema.org/PostalAddress"><=
meta itemprop=3D"description" content=3D"Location changed to UK-LON-6PS-9-C=
-Camden Town (No Externals Except For Interviews) (8) [GVC], US-NYC-9TH-11-=
A-232-It&#39;s Too Cold (7) [GVC], US-MTV-PLYM1625-4-A-Aesthetics (7) [GVC,=
 Phone], US-SAN-6420-4-3-Mt. Soledad (5) [GVC], US-SVL-CRSM1240-2-Q-Feijoad=
a (4) [GVC], US-MTV-1667-1-N-Hey Jude (8) [GVC, Phone], DE-MUC-ARN60-G-2-Oc=
hsenbraterei (7) [GVC], CH-ZRH-EURD-6-A-Pruntrut (5) [GVC]"/></span><div st=
yle=3D""><span style=3D"font-weight: 700;">Changed:</span> location</div></=
td></tr></tbody></table><!--[if mso | IE]><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td height=3D"12" style=
=3D"height:12px;"><![endif]--><div style=3D"height:12px;" aria-hidden=3D"tr=
ue"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endif]--><table bo=
rder=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=
=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"border=
: solid 1px #dadce0; border-radius: 8px; direction: rtl; font-size: 0; padd=
ing: 24px 32px; text-align: left; vertical-align: top;" class=3D"main-conta=
iner-inner"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspa=
cing=3D"0" role=3D"presentation"><tr><![endif]--><!--[if mso | IE]><td clas=
s=3D"" style=3D"vertical-align:top;width:37%;" ><![endif]--><div class=3D"c=
olumn-per-37 outlook-group-fix" style=3D"font-size: 13px; text-align: left;=
 direction: ltr; display: inline-block; vertical-align: top; width: 100%;ov=
erflow: hidden; word-wrap: break-word;"><table border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" role=3D"presentation" width=3D"100%"><tbody><tr><td st=
yle=3D"vertical-align:top;padding:0;"><table border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" role=3D"presentation" width=3D"100%"><tr><td style=3D"fo=
nt-size: 0; padding: 0; text-align: left; word-break: break-word;;padding-b=
ottom:28px;"><a href=3D"https://meet.google.com/wts-viup-bbu?hs=3D224" clas=
s=3D"primary-button-text" style=3D"display: inline-block;font-family: &#39;=
Google Sans&#39;, Roboto, sans-serif;font-size: 14px; letter-spacing: 0.25p=
x; line-height: 20px; mso-line-height-rule: exactly; text-decoration: none;=
 text-transform: none; word-wrap: break-word; white-space: nowrap;color: #f=
ff;font-weight: 700;white-space: normal;" target=3D"_blank"><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td al=
ign=3D"center" role=3D"presentation" valign=3D"middle" style=3D"background-=
color: #1a73e8; cursor: auto; padding: 10px 25px; border: none; border-radi=
us: 4px; margin: 0;" class=3D"primary-button"><span class=3D"primary-button=
-text" style=3D"font-family: &#39;Google Sans&#39;, Roboto, sans-serif;font=
-size: 14px; letter-spacing: 0.25px; line-height: 20px; mso-line-height-rul=
e: exactly; text-decoration: none; text-transform: none; word-wrap: break-w=
ord; white-space: nowrap;color: #fff;font-weight: 700;white-space: normal;"=
>Join with Google Meet</span></td></tr></table></a></td></tr><tr><td style=
=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;pad=
ding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-size:=
 14px; line-height: 20px; mso-line-height-rule: exactly; text-align: left;"=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=
=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight: 700;=
-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Meeting link</h=
2></td></tr></table><!-- Use grey text for the Meet link--><div><a style=3D=
"display: inline-block;;color: #70757a; text-decoration: none;" class=3D"se=
condary-text underline-on-hover" href=3D"https://meet.google.com/wts-viup-b=
bu?hs=3D224">meet.google.com/wts-viup-bbu</a></div></div></td></tr><tr><td =
style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word=
;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-=
size: 14px; line-height: 20px; mso-line-height-rule: exactly; text-align: l=
eft;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"prese=
ntation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" =
style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight:=
 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Join by ph=
one</h2></td></tr></table><span class=3D"secondary-text" style=3D"color: #7=
0757a; text-decoration: none;;">(US) </span><a href=3D"tel:+1-253-289-6982%=
3B52630526169%23" style=3D"display: inline-block;color: #1a73e8; text-decor=
ation: none;" target=3D"_blank" class=3D"accent-text underline-on-hover">+1=
 253-289-6982</a> <br><span class=3D"secondary-text" style=3D"color: #70757=
a; text-decoration: none;;">PIN: 52630526169</span><br><br><a href=3D"https=
://tel.meet/wts-viup-bbu?pin=3D4782004268358&amp;hs=3D0" style=3D"display: =
inline-block;color: #1a73e8; text-decoration: none;" target=3D"_blank" clas=
s=3D"accent-text underline-on-hover">More phone numbers</a><br></div></td><=
/tr></table></td></tr></tbody></table></div><!--[if mso | IE]></td><![endif=
]--><!--[if mso | IE]><td class=3D"" style=3D"vertical-align:top;width:63%;=
padding-right:32px;" ><![endif]--><div class=3D"column-per-63 outlook-group=
-fix" style=3D"font-size: 13px; text-align: left; direction: ltr; display: =
inline-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap:=
 break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" width=3D"100%" class=3D"main-column-table-ltr" style=3D"p=
adding-right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><tr><td c=
lass=3D"main-column-td" style=3D"padding:0; vertical-align:top;"><table bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=
=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0; pad=
ding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"><d=
iv style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight=
: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c=
4043; text-decoration: none;" class=3D"primary-text" role=3D"presentation">=
<span>Join us for Justin's Intern presentation about work he did over the s=
ummer regarding getting -Wformat enabled in the Linux kernel for Clang, and=
 profiling/performance work on building the Linux kernel faster with Clang.=
</span><meta itemprop=3D"description" content=3D"Join us for Justin&#39;s I=
ntern presentation about work he did over the summer regarding getting -Wfo=
rmat enabled in the Linux kernel for Clang, and profiling/performance work =
on building the Linux kernel faster with Clang."/></div></td></tr><tr><td s=
tyle=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;=
;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-s=
tyle: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter-=
spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-tex=
t" role=3D"presentation"><span aria-hidden=3D"true"><time itemprop=3D"start=
Date" datetime=3D"20220817T170000Z"></time><time itemprop=3D"endDate" datet=
ime=3D"20220817T180000Z"></time></span><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><t=
r><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; t=
ext-decoration: none;font-weight: 700;-webkit-font-smoothing: antialiased;m=
argin: 0; padding: 0;">When</h2></td></tr></table><span>Wednesday Aug 17, 2=
022 =E2=8B=85 10am =E2=80=93 11am (Pacific Time - Los Angeles)</span></div>=
</td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word=
-break: break-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto=
, sans-serif;font-style: normal; font-weight: 400; font-size: 14px; line-he=
ight: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" c=
lass=3D"primary-text" role=3D"presentation"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px=
;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c40=
43; text-decoration: none;font-weight: 700;-webkit-font-smoothing: antialia=
sed;margin: 0; padding: 0;">Location</h2></td><td style=3D"width: 8px;"></t=
d><td style=3D"padding-top: 2px; padding-bottom: 3px;"><div style=3D"backgr=
ound-color: #1e8e3e; border-radius: 10px; padding: 1px 5px; line-height: 13=
px;"><span style=3D"color: white; font-size: 11px; font-weight: 700; letter=
-spacing: 0.8px; text-transform: uppercase; vertical-align: top;">CHANGED</=
span></div></td></tr></table><span itemprop=3D"location" itemscope itemtype=
=3D"http://schema.org/Place"><span itemprop=3D"name" class=3D"primary-text =
notranslate" style=3D"font-family: Roboto, sans-serif;font-style: normal; f=
ont-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;=
color: #3c4043; text-decoration: none;">UK-LON-6PS-9-C-Camden Town (No Exte=
rnals Except For Interviews) (8) [GVC], US-NYC-9TH-11-A-232-It&#39;s Too Co=
ld (7) [GVC], US-MTV-PLYM1625-4-A-Aesthetics (7) [GVC, Phone], US-SAN-6420-=
4-3-Mt. Soledad (5) [GVC], US-SVL-CRSM1240-2-Q-Feijoada (4) [GVC], US-MTV-1=
667-1-N-Hey Jude (8) [GVC, Phone], DE-MUC-ARN60-G-2-Ochsenbraterei (7) [GVC=
], CH-ZRH-EURD-6-A-Pruntrut (5) [GVC]</span><br/><a href=3D"https://www.goo=
gle.com/maps/search/UK-LON-6PS-9-C-Camden+Town+%28No+Externals+Except+For+I=
nterviews%29+%288%29+%5BGVC%5D,+US-NYC-9TH-11-A-232-It%27s+Too+Cold+%287%29=
+%5BGVC%5D,+US-MTV-PLYM1625-4-A-Aesthetics+%287%29+%5BGVC,+Phone%5D,+US-SAN=
-6420-4-3-Mt.+Soledad+%285%29+%5BGVC%5D,+US-SVL-CRSM1240-2-Q-Feijoada+%284%=
29+%5BGVC%5D,+US-MTV-1667-1-N-Hey+Jude+%288%29+%5BGVC,+Phone%5D,+DE-MUC-ARN=
60-G-2-Ochsenbraterei+%287%29+%5BGVC%5D,+CH-ZRH-EURD-6-A-Pruntrut+%285%29+%=
5BGVC%5D?hl=3Den" class=3D"accent-text underline-on-hover" style=3D"display=
: inline-block;;color: #1a73e8; text-decoration: none;font-weight: 700;" ta=
rget=3D"_blank" itemprop=3D"map">View map</a></span></div></td></tr><tr><td=
 style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-wor=
d;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font=
-style: normal; font-weight: 400; font-size: 14px; line-height: 20px; lette=
r-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-t=
ext" role=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 cl=
ass=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decorati=
on: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; pa=
dding: 0;">Guests</h2></td></tr></table><div style=3D"padding-bottom: 4px; =
text-align: left;;color: #3c4042;"><div><span itemprop=3D"attendee" itemsco=
pe itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"n=
otranslate"><a class=3D"primary-text underline-on-hover" style=3D"display: =
inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:ndesau=
lniers@google.com">Nick Desaulniers</a></span><meta itemprop=3D"email" cont=
ent=3D"ndesaulniers@google.com"/></span><span itemprop=3D"organizer" itemsc=
ope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=
=3D"Nick Desaulniers"/><meta itemprop=3D"email" content=3D"ndesaulniers@goo=
gle.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; te=
xt-decoration: none;"> - organizer</span></div><div><span itemprop=3D"atten=
dee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name=
" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:gosst-kernel@google.com">gosst-kernel</a></span><meta itemprop=3D"em=
ail" content=3D"gosst-kernel@google.com"/></span><span class=3D"secondary-t=
ext" style=3D"color: #70757a; text-decoration: none;"></span></div><div><sp=
an itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><s=
pan itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underl=
ine-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decorati=
on: none;" href=3D"mailto:android-llvm-dev@google.com">android-llvm-dev</a>=
</span><meta itemprop=3D"email" content=3D"android-llvm-dev@google.com"/></=
span><span class=3D"secondary-text" style=3D"color: #70757a; text-decoratio=
n: none;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=
=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"=
><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bloc=
k;;color: #3c4043; text-decoration: none;" href=3D"mailto:android-kernel-te=
am@google.com">android-kernel-team</a></span><meta itemprop=3D"email" conte=
nt=3D"android-kernel-team@google.com"/></span><span class=3D"secondary-text=
" style=3D"color: #70757a; text-decoration: none;"></span></div><div><span =
itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span=
 itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline=
-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration:=
 none;" href=3D"mailto:kernel-dynamic-tools@google.com">kernel-dynamic-tool=
s</a></span><meta itemprop=3D"email" content=3D"kernel-dynamic-tools@google=
.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-=
decoration: none;"></span></div><div><span itemprop=3D"attendee" itemscope =
itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notr=
anslate"><a class=3D"primary-text underline-on-hover" style=3D"display: inl=
ine-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:natechanc=
ellor@gmail.com">natechancellor@gmail.com</a></span><meta itemprop=3D"email=
" content=3D"natechancellor@gmail.com"/></span><span class=3D"secondary-tex=
t" style=3D"color: #70757a; text-decoration: none;"></span></div><div><span=
 itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><spa=
n itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underlin=
e-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration=
: none;" href=3D"mailto:clang-built-linux@googlegroups.com">Clang Built Lin=
ux</a></span><meta itemprop=3D"email" content=3D"clang-built-linux@googlegr=
oups.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; t=
ext-decoration: none;"></span></div><div><span itemprop=3D"attendee" itemsc=
ope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"=
notranslate"><a class=3D"primary-text underline-on-hover" style=3D"display:=
 inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:llvm@=
lists.linux.dev">llvm@lists.linux.dev</a></span><meta itemprop=3D"email" co=
ntent=3D"llvm@lists.linux.dev"/></span><span class=3D"secondary-text" style=
=3D"color: #70757a; text-decoration: none;"></span></div><div><span itempro=
p=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempr=
op=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hov=
er" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;"=
 href=3D"mailto:sedat.dilek@dhl.com">Sedat Dilek (DHL Supply Chain)</a></sp=
an><meta itemprop=3D"email" content=3D"sedat.dilek@dhl.com"/></span><span c=
lass=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></=
span></div></div><a href=3D"https://calendar.google.com/calendar/event?acti=
on=3DVIEW&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsNm5sOGggbGx2bUBsaXN0cy5saW5=
1eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb204ZjQwMzA4ZDgzMWNkMjM4=
MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3De=
n&amp;es=3D0" style=3D"display: inline-block;;color: #1a73e8; text-decorati=
on: none;font-weight: 700;" target=3D"_blank" class=3D"accent-text underlin=
e-on-hover">View all guest info</a></div></td></tr><tr><td style=3D"font-si=
ze: 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom=
:0px;"><div style=3D"color: #3c4043; text-decoration: none;;font-family: Ro=
boto, sans-serif;font-size: 14px; line-height: 20px; mso-line-height-rule: =
exactly; text-align: left;" class=3D"primary-text"><div><span style=3D"font=
-weight: 700;-webkit-font-smoothing: antialiased;">Reply</span><span class=
=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"> for <=
a class=3D"secondary-text underline-on-hover" style=3D"display: inline-bloc=
k;;color: #70757a; text-decoration: none;" href=3D"mailto:llvm@lists.linux.=
dev">llvm@lists.linux.dev</a></span></div></div></td></tr><tr><td style=3D"=
font-size: 0; padding: 0; text-align: left; word-break: break-word;;padding=
-bottom:16px;"><div style=3D"font-family: Roboto, sans-serif;font-size: 14p=
x; line-height: 20px; mso-line-height-rule: exactly; text-align: left;"><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" =
style=3D"border-collapse: separate;"><tr><td style=3D"padding-top: 8px; pad=
ding-left: 0; padding-right: 12px;"><!-- RSVP buttons --><table border=3D"0=
" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border=
: solid 1px #dadce0; border-radius: 16px; border-collapse: separate;font-fa=
mily: &#39;Google Sans&#39;, Roboto, sans-serif;;display: inline-block;;mar=
gin-right: 12px; margin-left: 0;"><tr><td align=3D"center" vertical-align=
=3D"middle" role=3D"presentation"><span itemprop=3D"potentialaction" itemsc=
ope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance"=
 content=3D"http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handle=
r" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><link itempro=
p=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=
=3D"color: #5f6367;"><a href=3D"https://calendar.google.com/calendar/event?=
action=3DRESPOND&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsNm5sOGggbGx2bUBsaXN0=
cy5saW51eC5kZXY&amp;rst=3D1&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb204Z=
jQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmerica%2FLos=
_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#3=
9;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; lin=
e-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: =
none; text-transform: none;" class=3D"grey-button-text" itemprop=3D"url" ta=
rget=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" rol=
e=3D"presentation"><tr><td align=3D"center" role=3D"presentation" valign=3D=
"middle" style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; =
white-space: nowrap;"><span class=3D"grey-button-text" style=3D"font-weight=
: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368=
; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin=
: 0; text-decoration: none; text-transform: none;">Yes</span></td></tr></ta=
ble></a></span></span></span></td><td align=3D"center" vertical-align=3D"mi=
ddle" role=3D"presentation" style=3D"border-left: solid 1px #dadce0; border=
-right: solid 1px #dadce0;"><span itemprop=3D"potentialaction" itemscope it=
emtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" conte=
nt=3D"http://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" item=
scope itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"me=
thod" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"colo=
r: #5f6367;"><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsNm5sOGggbGx2bUBsaXN0cy5saW=
51eC5kZXY&amp;rst=3D2&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb204ZjQwMzA=
4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmerica%2FLos_Angel=
es&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Goog=
le Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-heig=
ht: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; =
text-transform: none;" class=3D"grey-button-text" itemprop=3D"url" target=
=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D=
"presentation"><tr><td align=3D"center" role=3D"presentation" valign=3D"mid=
dle" style=3D"padding: 6px 12px; white-space: nowrap;"><span class=3D"grey-=
button-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, =
Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-=
line-height-rule: exactly; margin: 0; text-decoration: none; text-transform=
: none;">No</span></td></tr></table></a></span></span></span></td><td align=
=3D"center" vertical-align=3D"middle" role=3D"presentation"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/May=
be"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/Htt=
pActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReq=
uestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calenda=
r.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNGVoYWEyOWkxanEwYjU1=
cnQzNnJsNm5sOGggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D3&amp;tok=3DMjMjbmRlc=
2F1bG5pZXJzQGdvb2dsZS5jb204ZjQwMzA4ZDgzMWNkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRl=
MmMx&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-=
weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #=
5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; =
margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-butt=
on-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" rol=
e=3D"presentation" valign=3D"middle" style=3D"padding: 6px 0; padding-left:=
 12px; padding-right: 16px; white-space: nowrap;"><span class=3D"grey-butto=
n-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Robot=
o, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-=
height-rule: exactly; margin: 0; text-decoration: none; text-transform: non=
e;">Maybe</span></td></tr></table></a></span></span></span></td></tr></tabl=
e><!-- More options --><a href=3D"https://calendar.google.com/calendar/even=
t?action=3DVIEW&amp;eid=3DNGVoYWEyOWkxanEwYjU1cnQzNnJsNm5sOGggbGx2bUBsaXN0c=
y5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb204ZjQwMzA4ZDgzMW=
NkMjM4MzBjMzRjNDg0YmIxOWQ0YzRkMmRlMmMx&amp;ctz=3DAmerica%2FLos_Angeles&amp;=
hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font-weight: 400;font-f=
amily: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size:=
 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-de=
coration: none; text-transform: none;" class=3D"grey-button-text" target=3D=
"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" style=3D"border: solid 1px #dadce0; border-radius: 16px; border=
-collapse: separate;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;=
"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"presentation" =
style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-spa=
ce: nowrap;;color: #5f6367;"><span class=3D"grey-button-text" style=3D"font=
-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: =
#5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly;=
 margin: 0; text-decoration: none; text-transform: none;">More options</spa=
n></td></tr></table></a></td></tr></table></div></td></tr></table></td></tr=
></tbody></table></div><!--[if mso | IE]></td><![endif]--><!--[if mso | IE]=
></tr></table><![endif]--></td></tr></tbody></table><table border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" sty=
le=3D"width:100%;" class=3D""><tbody><tr><td style=3D"font-size: 0; padding=
: 0; text-align: left; word-break: break-word;;padding:4px 12px;" class=3D"=
" align=3D"left"><div class=3D"secondary-text" style=3D"color: #70757a; tex=
t-decoration: none;font-family: Roboto, sans-serif;font-size: 12px; line-he=
ight: 16px; mso-line-height-rule: exactly; text-align: left;"><p>Invitation=
 from <a href=3D"https://calendar.google.com/calendar/" class=3D"accent-tex=
t underline-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 1=
2px; line-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text=
-decoration: none;" target=3D"_blank">Google Calendar</a></p><p>You are rec=
eiving this email because you are an attendee on the event. To stop receivi=
ng future updates for this event, decline this event.</p><p>Forwarding this=
 invitation could allow any recipient to send a response to the organizer, =
be added to the guest list, invite others regardless of their own invitatio=
n status, or modify your RSVP. <a class=3D"accent-text underline-on-hover" =
style=3D"font-family: Roboto, sans-serif;font-size: 12px; line-height: 16px=
; mso-line-height-rule: exactly;;color: #1a73e8; text-decoration: none;" hr=
ef=3D"https://support.google.com/calendar/answer/37135#forwarding">Learn mo=
re</a></p></div></td></tr></tbody></table></td></tr></tbody></table></span>=
</span></body></html>
--0000000000002af18c05e5e84837
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
DTSTAMP:20220810T194449Z
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
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=natechancellor@gmail.com;X-NUM-GUESTS=0:mailto:natechancellor@gmail.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Clang Built Linux;X-NUM-GUESTS=0:mailto:clang-built-linux@googlegro
 ups.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=llvm@lists.linux.dev;X-NUM-GUESTS=0:mailto:llvm@lists.linux.dev
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=Sedat Dilek (DHL Supply Chain);X-NUM-GUESTS=0:mailto:sedat.dilek@dhl.co
 m
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=UK-LON-6PS-9-C-Camden Town (No Externals Except For Interviews) (8) [
 GVC];X-NUM-GUESTS=0:mailto:google.com_726f6f6d5f756b5f6c6f6e5f3670735f395f3
 96330@resource.calendar.google.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=US-NYC-9TH-11-A-232-It's Too Cold (7) [GVC];X-NUM-GUESTS=0:mailto:goo
 gle.com_726f6f6d5f75735f6e79635f3974685f31315f313161323332@resource.calenda
 r.google.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN="US-MTV-PLYM1625-4-A-Aesthetics (7) [GVC, Phone]";X-NUM-GUESTS=0:mail
 to:google.com_726f6f6d5f75735f6d74765f706c796d313632355f345f346132@resource
 .calendar.google.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=US-SAN-6420-4-3-Mt. Soledad (5) [GVC];X-NUM-GUESTS=0:mailto:google.co
 m_726f6f6d5f75735f73616e5f363432305f345f343334@resource.calendar.google.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=US-SVL-CRSM1240-2-Q-Feijoada (4) [GVC];X-NUM-GUESTS=0:mailto:google.c
 om_726f6f6d5f75735f73766c5f6372736d313234305f325f327133@resource.calendar.g
 oogle.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN="US-MTV-1667-1-N-Hey Jude (8) [GVC, Phone]";X-NUM-GUESTS=0:mailto:goo
 gle.com_726f6f6d5f75735f6d74765f313636375f315f316e34@resource.calendar.goog
 le.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=DE-MUC-ARN60-G-2-Ochsenbraterei (7) [GVC];X-NUM-GUESTS=0:mailto:c_188
 a6bnqb18uiinrgvr6v18gtg2ua4gactnmuprcckn66rrd@resource.calendar.google.com
ATTENDEE;CUTYPE=RESOURCE;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TR
 UE;CN=CH-ZRH-EURD-6-A-Pruntrut (5) [GVC];X-NUM-GUESTS=0:mailto:c_1887deim3r
 5k0i5tgpf94aorhl3k2@resource.calendar.google.com
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
 les&hl=en&es=0.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20220810T194447Z
LOCATION:UK-LON-6PS-9-C-Camden Town (No Externals Except For Interviews) (8
 ) [GVC]\, US-NYC-9TH-11-A-232-It's Too Cold (7) [GVC]\, US-MTV-PLYM1625-4-A
 -Aesthetics (7) [GVC\, Phone]\, US-SAN-6420-4-3-Mt. Soledad (5) [GVC]\, US-
 SVL-CRSM1240-2-Q-Feijoada (4) [GVC]\, US-MTV-1667-1-N-Hey Jude (8) [GVC\, P
 hone]\, DE-MUC-ARN60-G-2-Ochsenbraterei (7) [GVC]\, CH-ZRH-EURD-6-A-Pruntru
 t (5) [GVC]
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:Justin Stitt's Intern Presentation
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000002af18c05e5e84837--
--0000000000002af19005e5e84839
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjIwODE3VDE3MDAwMFoNCkRURU5EOjIwMjIwODE3
VDE4MDAwMFoNCkRUU1RBTVA6MjAyMjA4MTBUMTk0NDQ5Wg0KT1JHQU5JWkVSO0NOPU5pY2sgRGVz
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
QVQ9QUNDRVBURUQ7UlNWUD1UUlVFDQogO0NOPW5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbTtYLU5V
TS1HVUVTVFM9MDptYWlsdG86bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tDQpBVFRFTkRFRTtDVVRZ
UEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047
UlNWUD0NCiBUUlVFO0NOPUNsYW5nIEJ1aWx0IExpbnV4O1gtTlVNLUdVRVNUUz0wOm1haWx0bzpj
bGFuZy1idWlsdC1saW51eEBnb29nbGVncm8NCiB1cHMuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5E
SVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0N
CiBUUlVFO0NOPWxsdm1AbGlzdHMubGludXguZGV2O1gtTlVNLUdVRVNUUz0wOm1haWx0bzpsbHZt
QGxpc3RzLmxpbnV4LmRldg0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFS
VElDSVBBTlQ7UEFSVFNUQVQ9QUNDRVBURUQ7UlNWUD1UUlVFDQogO0NOPVNlZGF0IERpbGVrIChE
SEwgU3VwcGx5IENoYWluKTtYLU5VTS1HVUVTVFM9MDptYWlsdG86c2VkYXQuZGlsZWtAZGhsLmNv
DQogbQ0KQVRURU5ERUU7Q1VUWVBFPVJFU09VUkNFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRT
VEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSDQogVUU7Q049VUstTE9OLTZQUy05LUMtQ2FtZGVuIFRv
d24gKE5vIEV4dGVybmFscyBFeGNlcHQgRm9yIEludGVydmlld3MpICg4KSBbDQogR1ZDXTtYLU5V
TS1HVUVTVFM9MDptYWlsdG86Z29vZ2xlLmNvbV83MjZmNmY2ZDVmNzU2YjVmNmM2ZjZlNWYzNjcw
NzM1ZjM5NWYzDQogOTYzMzBAcmVzb3VyY2UuY2FsZW5kYXIuZ29vZ2xlLmNvbQ0KQVRURU5ERUU7
Q1VUWVBFPVJFU09VUkNFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElP
TjtSU1ZQPVRSDQogVUU7Q049VVMtTllDLTlUSC0xMS1BLTIzMi1JdCdzIFRvbyBDb2xkICg3KSBb
R1ZDXTtYLU5VTS1HVUVTVFM9MDptYWlsdG86Z29vDQogZ2xlLmNvbV83MjZmNmY2ZDVmNzU3MzVm
NmU3OTYzNWYzOTc0Njg1ZjMxMzE1ZjMxMzE2MTMyMzMzMkByZXNvdXJjZS5jYWxlbmRhDQogci5n
b29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9UkVTT1VSQ0U7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFINCiBVRTtDTj0iVVMtTVRWLVBMWU0xNjI1LTQt
QS1BZXN0aGV0aWNzICg3KSBbR1ZDLCBQaG9uZV0iO1gtTlVNLUdVRVNUUz0wOm1haWwNCiB0bzpn
b29nbGUuY29tXzcyNmY2ZjZkNWY3NTczNWY2ZDc0NzY1ZjcwNmM3OTZkMzEzNjMyMzU1ZjM0NWYz
NDYxMzJAcmVzb3VyY2UNCiAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPVJF
U09VUkNFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRS
DQogVUU7Q049VVMtU0FOLTY0MjAtNC0zLU10LiBTb2xlZGFkICg1KSBbR1ZDXTtYLU5VTS1HVUVT
VFM9MDptYWlsdG86Z29vZ2xlLmNvDQogbV83MjZmNmY2ZDVmNzU3MzVmNzM2MTZlNWYzNjM0MzIz
MDVmMzQ1ZjM0MzMzNEByZXNvdXJjZS5jYWxlbmRhci5nb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZ
UEU9UkVTT1VSQ0U7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JT
VlA9VFINCiBVRTtDTj1VUy1TVkwtQ1JTTTEyNDAtMi1RLUZlaWpvYWRhICg0KSBbR1ZDXTtYLU5V
TS1HVUVTVFM9MDptYWlsdG86Z29vZ2xlLmMNCiBvbV83MjZmNmY2ZDVmNzU3MzVmNzM3NjZjNWY2
MzcyNzM2ZDMxMzIzNDMwNWYzMjVmMzI3MTMzQHJlc291cmNlLmNhbGVuZGFyLmcNCiBvb2dsZS5j
b20NCkFUVEVOREVFO0NVVFlQRT1SRVNPVVJDRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RB
VD1ORUVEUy1BQ1RJT047UlNWUD1UUg0KIFVFO0NOPSJVUy1NVFYtMTY2Ny0xLU4tSGV5IEp1ZGUg
KDgpIFtHVkMsIFBob25lXSI7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmdvbw0KIGdsZS5jb21fNzI2
ZjZmNmQ1Zjc1NzM1ZjZkNzQ3NjVmMzEzNjM2Mzc1ZjMxNWYzMTZlMzRAcmVzb3VyY2UuY2FsZW5k
YXIuZ29vZw0KIGxlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPVJFU09VUkNFO1JPTEU9UkVRLVBBUlRJ
Q0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSDQogVUU7Q049REUtTVVDLUFSTjYw
LUctMi1PY2hzZW5icmF0ZXJlaSAoNykgW0dWQ107WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmNfMTg4
DQogYTZibnFiMTh1aWlucmd2cjZ2MThndGcydWE0Z2FjdG5tdXByY2NrbjY2cnJkQHJlc291cmNl
LmNhbGVuZGFyLmdvb2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1SRVNPVVJDRTtST0xFPVJFUS1Q
QVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUg0KIFVFO0NOPUNILVpSSC1F
VVJELTYtQS1QcnVudHJ1dCAoNSkgW0dWQ107WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmNfMTg4N2Rl
aW0zcg0KIDVrMGk1dGdwZjk0YW9yaGwzazJAcmVzb3VyY2UuY2FsZW5kYXIuZ29vZ2xlLmNvbQ0K
WC1HT09HTEUtQ09ORkVSRU5DRTpodHRwczovL21lZXQuZ29vZ2xlLmNvbS93dHMtdml1cC1iYnUN
ClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDotNzk2ODU5NTI0DQpDUkVBVEVEOjIwMjIwODAx
VDE4NTcxMFoNCkRFU0NSSVBUSU9OOkpvaW4gdXMgZm9yIEp1c3RpbidzIEludGVybiBwcmVzZW50
YXRpb24gYWJvdXQgd29yayBoZSBkaWQgb3Zlcg0KICB0aGUgc3VtbWVyIHJlZ2FyZGluZyBnZXR0
aW5nIC1XZm9ybWF0IGVuYWJsZWQgaW4gdGhlIExpbnV4IGtlcm5lbCBmb3IgQ2xhbg0KIGdcLCBh
bmQgcHJvZmlsaW5nL3BlcmZvcm1hbmNlIHdvcmsgb24gYnVpbGRpbmcgdGhlIExpbnV4IGtlcm5l
bCBmYXN0ZXIgd2l0aA0KICBDbGFuZy5cblxuLTo6fjp+Ojp+On46fjp+On46fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Og0KIH46fjp+On46fjp+On46fjo6fjp+
OjotXG5EbyBub3QgZWRpdCB0aGlzIHNlY3Rpb24gb2YgdGhlIGRlc2NyaXB0aW9uLlxuXG5UaA0K
IGlzIGV2ZW50IGhhcyBhIHZpZGVvIGNhbGwuXG5Kb2luOiBodHRwczovL21lZXQuZ29vZ2xlLmNv
bS93dHMtdml1cC1iYnVcbihVUw0KICkgKzEgMjUzLTI4OS02OTgyIFBJTjogNTI2MzA1MjYxNjkj
XG5WaWV3IG1vcmUgcGhvbmUgbnVtYmVyczogaHR0cHM6Ly90ZWwubQ0KIGVldC93dHMtdml1cC1i
YnU/cGluPTQ3ODIwMDQyNjgzNTgmaHM9N1xuXG5WaWV3IHlvdXIgZXZlbnQgYXQgaHR0cHM6Ly9j
YWxlbg0KIGRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1OR1Zv
WVdFeU9Xa3hhbkV3WWpVMWNuUXpObkpzTg0KIG01c09HZ2diR3gyYlVCc2FYTjBjeTVzYVc1MWVD
NWtaWFkmdG9rPU1qTWpibVJsYzJGMWJHNXBaWEp6UUdkdmIyZHNaUzVqYjIwNA0KIFpqUXdNekE0
WkRnek1XTmtNak00TXpCak16UmpORGcwWW1JeE9XUTBZelJrTW1SbE1tTXgmY3R6PUFtZXJpY2El
MkZMb3NfQW5nZQ0KIGxlcyZobD1lbiZlcz0wLlxuLTo6fjp+Ojp+On46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Og0KIH46fjp+On46fjp+On46fjp+On46fjo6
fjp+OjotDQpMQVNULU1PRElGSUVEOjIwMjIwODEwVDE5NDQ0N1oNCkxPQ0FUSU9OOlVLLUxPTi02
UFMtOS1DLUNhbWRlbiBUb3duIChObyBFeHRlcm5hbHMgRXhjZXB0IEZvciBJbnRlcnZpZXdzKSAo
OA0KICkgW0dWQ11cLCBVUy1OWUMtOVRILTExLUEtMjMyLUl0J3MgVG9vIENvbGQgKDcpIFtHVkNd
XCwgVVMtTVRWLVBMWU0xNjI1LTQtQQ0KIC1BZXN0aGV0aWNzICg3KSBbR1ZDXCwgUGhvbmVdXCwg
VVMtU0FOLTY0MjAtNC0zLU10LiBTb2xlZGFkICg1KSBbR1ZDXVwsIFVTLQ0KIFNWTC1DUlNNMTI0
MC0yLVEtRmVpam9hZGEgKDQpIFtHVkNdXCwgVVMtTVRWLTE2NjctMS1OLUhleSBKdWRlICg4KSBb
R1ZDXCwgUA0KIGhvbmVdXCwgREUtTVVDLUFSTjYwLUctMi1PY2hzZW5icmF0ZXJlaSAoNykgW0dW
Q11cLCBDSC1aUkgtRVVSRC02LUEtUHJ1bnRydQ0KIHQgKDUpIFtHVkNdDQpTRVFVRU5DRTowDQpT
VEFUVVM6Q09ORklSTUVEDQpTVU1NQVJZOkp1c3RpbiBTdGl0dCdzIEludGVybiBQcmVzZW50YXRp
b24NClRSQU5TUDpPUEFRVUUNCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==
--0000000000002af19005e5e84839--
