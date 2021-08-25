Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3173FC1
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 22:54:05 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id 98-20020aed316b000000b00298da0dd56bso638508qtg.13
        for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:reply-to:sender:message-id:date:subject:from:to;
        bh=Pc1Csbf/nlMICUkAADLbED+5hIMQKVCH9VzgM3Esjc0=;
        b=XFBTMKAWF/ldL/qldrnq2e97d6c8l56BM8D4hTywtXVH/QgNrl+v/pW5CU+qq5i86Q
         S4QjAt4usCd0RgPQoVavbCEhXk1NEsVrPlZNnj1gMkhnhX13VROUK8+1HeQNaQJX5pBd
         bZuBn7VuT6F7DXaYNLZb8Nc98v+2xM0cPsnRgvor/JNr8qNpNhKRcHc40rl6WXyamoac
         TQW61prlgoNPlw2Mo4BGZ+GqwpC+kqeMZiUAecHVP11T9JkCrJT2Pps1WBS1+V0Yqs1Y
         VJIf02WRYp0CNsjNL9AJfOtQVS+rlyJvZ5nfZEiBNJ0xjbL5ajuuXWcKC0bUGp/91fT/
         QKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
         :subject:from:to;
        bh=Pc1Csbf/nlMICUkAADLbED+5hIMQKVCH9VzgM3Esjc0=;
        b=b4p8fsus6Ef8rs4gpWwk+HSVwNOxqmQdced+KXPv9g0mf5KRl44eOpIJYp0X/kkG2F
         j+m2uUYX3VngLCR23aYbsNOhrc9JzzWuEjgP6g5Q36iDCUSR9PZQdk0uAqnurb+0bkJ2
         9MTIPXWXghW/Y32pcxinc7w9YqLLvJU/JHwBcnRVTr/v0qe8V4PqLgutjT0JdHk6od8F
         nedPjcJRc+EdS7+Sv9L0kv0+SUpFXJK3KBW+iyOBC9B815oWDs8urfubXz9Q9UQ7GiZm
         dMwrl04+4agAHSX0BJLnD1KvLMlf5sD5d24Jy9mgzfLO92FsoDvLXNTqI4k6Ie5CEl5g
         8nXw==
X-Gm-Message-State: AOAM532wuTPhxQbCzLD3+jVaoUxb57haTYQlGYJGePXiJhtGynPIzBet
	CwjiGNOxMWZoYxhDrrtE6mV1aDQTSmUK/LkKYktMb7CZlUEX965KpNd4gHlOP0pWn0X8YZwjsvs
	Qv8zxRUbKXyDbszFXQdoZHnYbD8YuewDe5hHRE03yxpHNdJrv/Iq0r8lpNoQTg+rTcypZwr7WUH
	MRza8=
X-Google-Smtp-Source: ABdhPJzreICBsnyFICZ3Clv8T4wf9zz7qhY3yzK3xaupWkwG8EiPztp4t0d1oUY6P5PiHFD3srcpa2rxfW0kdZ22Cc57
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:620a:110d:: with SMTP id o13mr974061qkk.108.1629932043744;
 Wed, 25 Aug 2021 15:54:03 -0700 (PDT)
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <0000000000007a25e605ca6a208c@google.com>
Date: Wed, 25 Aug 2021 22:54:03 +0000
Subject: Invitation: (No Subject) @ Fri Sep 24, 2021 7am - 11am (PDT) (llvm@lists.linux.dev)
From: Nick Desaulniers <ndesaulniers@google.com>
To: llvm@lists.linux.dev, 
	Clang Built Linux <clang-built-linux@googlegroups.com>, jemarch@gnu.org
Content-Type: multipart/mixed; boundary="0000000000007a25d105ca6a208b"

--0000000000007a25d105ca6a208b
Content-Type: multipart/alternative; boundary="0000000000007a25d005ca6a2089"

--0000000000007a25d005ca6a2089
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WW91IGhhdmUgYmVlbiBpbnZpdGVkIHRvIHRoZSBmb2xsb3dpbmcgZXZlbnQuDQoNClRpdGxlOiAo
Tm8gU3ViamVjdCkNCmh0dHBzOi8vbGludXhwbHVtYmVyc2NvbmYub3JnL2V2ZW50LzExL3Nlc3Np
b25zLzEwNy8jMjAyMTA5MjQNCmh0dHBzOi8vbGludXhwbHVtYmVyc2NvbmYub3JnL2V2ZW50LzEx
L3RpbWV0YWJsZS8jYWxsDQpXaGVuOiBGcmkgU2VwIDI0LCAyMDIxIDdhbSDigJMgMTFhbSBQYWNp
ZmljIFRpbWUgLSBMb3MgQW5nZWxlcw0KDQpKb2luaW5nIGluZm86IEpvaW4gd2l0aCBHb29nbGUg
TWVldA0KaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vbnVnLWllbnAtZHRrP2hzPTIyNA0KDQpKb2lu
IGJ5IHBob25lDQooVVMpICsxIDQwMS04MzAtMzMzNyAoUElOOiA1ODM5ODM5NjYpDQoNCk1vcmUg
cGhvbmUgbnVtYmVyczogaHR0cHM6Ly90ZWwubWVldC9udWctaWVucC1kdGs/cGluPTkzODcxNjI3
OTU0OTImaHM9MA0KDQpDYWxlbmRhcjogbGx2bUBsaXN0cy5saW51eC5kZXYNCldobzoNCiAgICAg
KiBOaWNrIERlc2F1bG5pZXJzIC0gb3JnYW5pemVyDQogICAgICogQ2xhbmcgQnVpbHQgTGludXgN
CiAgICAgKiBsbHZtQGxpc3RzLmxpbnV4LmRldg0KICAgICAqIGplbWFyY2hAZ251Lm9yZw0KDQpF
dmVudCBkZXRhaWxzOiAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZl
bnQ/YWN0aW9uPVZJRVcmZWlkPU1Ha3diMmxrYzJKdGFqZHFkV2xsWVc1bmFtb3haRGhtWkRnZ2JH
eDJiVUJzYVhOMGN5NXNhVzUxZUM1a1pYWSZ0b2s9TWpNamJtUmxjMkYxYkc1cFpYSnpRR2R2YjJk
c1pTNWpiMjB6TURZMFpESTNaVFk0WkdVMVlqZzJNVEpsTW1FMk9EVTRPV0UzWVRFNE9URmpOemxq
TVRVeiZjdHo9QW1lcmljYSUyRkxvc19BbmdlbGVzJmhsPWVuJmVzPTANCg0KSW52aXRhdGlvbiBm
cm9tIEdvb2dsZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFy
Lw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGNvdXJ0ZXN5IGVtYWlsIGF0IHRoZSBhY2NvdW50
IGxsdm1AbGlzdHMubGludXguZGV2ICANCmJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvZiB0
aGlzIGV2ZW50Lg0KDQpUbyBzdG9wIHJlY2VpdmluZyBmdXR1cmUgdXBkYXRlcyBmb3IgdGhpcyBl
dmVudCwgZGVjbGluZSB0aGlzIGV2ZW50LiAgDQpBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gc2lnbiB1
cCBmb3IgYSBHb29nbGUgYWNjb3VudCBhdCAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20v
Y2FsZW5kYXIvIGFuZCBjb250cm9sIHlvdXIgbm90aWZpY2F0aW9uICANCnNldHRpbmdzIGZvciB5
b3VyIGVudGlyZSBjYWxlbmRhci4NCg0KRm9yd2FyZGluZyB0aGlzIGludml0YXRpb24gY291bGQg
YWxsb3cgYW55IHJlY2lwaWVudCB0byBzZW5kIGEgcmVzcG9uc2UgdG8gIA0KdGhlIG9yZ2FuaXpl
ciBhbmQgYmUgYWRkZWQgdG8gdGhlIGd1ZXN0IGxpc3QsIG9yIGludml0ZSBvdGhlcnMgcmVnYXJk
bGVzcyAgDQpvZiB0aGVpciBvd24gaW52aXRhdGlvbiBzdGF0dXMsIG9yIHRvIG1vZGlmeSB5b3Vy
IFJTVlAuIExlYXJuIG1vcmUgYXQgIA0KaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2FsZW5k
YXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--0000000000007a25d005ca6a2089
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span style=3D"=
display:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Pe=
rson"><meta itemprop=3D"description" content=3D"Invitation from Nick Desaul=
niers"/></span><span itemprop=3D"object" itemscope itemtype=3D"http://schem=
a.org/Event"><div style=3D""><table cellspacing=3D"0" cellpadding=3D"8" bor=
der=3D"0" summary=3D"" style=3D"width:100%;font-family:Arial,Sans-serif;bor=
der:1px Solid #ccc;border-width:1px 2px 2px 1px;background-color:#fff;"><tr=
><td><meta itemprop=3D"eventStatus" content=3D"http://schema.org/EventSched=
uled"/><h4 style=3D"padding:6px 0;margin:0 0 4px 0;font-family:Arial,Sans-s=
erif;font-size:13px;line-height:1.4;border:1px Solid #fff;background:#fff;c=
olor:#090;font-weight:normal"><strong>You have been invited to the followin=
g event.</strong></h4><div style=3D"padding:2px"><span itemprop=3D"publishe=
r" itemscope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"=
name" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleC=
alendar" content=3D"0i0oidsbmj7juieangjj1d8fd8"/><h3 style=3D"padding:0 0 6=
px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:bold;=
color:#222"><span itemprop=3D"name">(No Subject)</span></h3><table style=3D=
"display:inline-table" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" sum=
mary=3D"Event details"><tr><td style=3D"padding:0 1em 10px 0;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" val=
ign=3D"top"><div><i style=3D"font-style:normal">When</i></div></td><td styl=
e=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:=
#222" valign=3D"top"><div style=3D"text-indent:-1px"><time itemprop=3D"star=
tDate" datetime=3D"20210924T140000Z"></time><time itemprop=3D"endDate" date=
time=3D"20210924T180000Z"></time>Fri Sep 24, 2021 7am =E2=80=93 11am <span =
style=3D"color:#888">Pacific Time - Los Angeles</span></div></td></tr><tr><=
td style=3D"padding:0 1em 4px 0;font-family:Arial,Sans-serif;font-size:13px=
;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"=
font-style:normal">Joining info</i></div></td><td style=3D"padding-bottom:4=
px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><=
div style=3D"text-indent:-1px">Join with Google Meet</div></td></tr><tr><td=
 style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;=
color:#888;white-space:nowrap;width:90px"></td><td style=3D"padding-bottom:=
10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"=
><div style=3D"text-indent:-1px"><div style=3D"text-indent:-1px"><span item=
prop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/JoinAction=
"><span itemprop=3D"name" content=3D"meet.google.com/nug-ienp-dtk"><span it=
emprop=3D"target" itemscope itemtype=3D"http://schema.org/EntryPoint"><span=
 itemprop=3D"url" content=3D"https://meet.google.com/nug-ienp-dtk?hs=3D224"=
><span itemprop=3D"httpMethod" content=3D"GET"><a href=3D"https://meet.goog=
le.com/nug-ienp-dtk?hs=3D224" style=3D"color:#20c;white-space:nowrap" targe=
t=3D"_blank">meet.google.com/nug-ienp-dtk</a></span></span></span></span></=
span> </div></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px=
"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-s=
ize:13px;color:#222" valign=3D"top"></td></tr><td style=3D"padding:0 1em 4p=
x 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowr=
ap;width:90px"></td><td style=3D"padding-bottom:4px;font-family:Arial,Sans-=
serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-=
1px">Join by phone</div></td><tr><td style=3D"padding:0 1em 10px 0;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90p=
x"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-=
size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1px"><div s=
tyle=3D"text-indent:-1px"><span style=3D"color:#888">(US) </span><a href=3D=
"tel:+1-401-830-3337;583983966#" style=3D"color:#20c;white-space:nowrap" ta=
rget=3D"_blank">+1 401-830-3337</a> <span style=3D"color:#888">(PIN: 583983=
966)</span></div></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font=
-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width=
:90px"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;f=
ont-size:13px;color:#222" valign=3D"top"></td></tr><tr><td style=3D"padding=
:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-=
space:nowrap;width:90px"></td><td style=3D"padding-bottom:10px;font-family:=
Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"te=
xt-indent:-1px"><a href=3D"https://tel.meet/nug-ienp-dtk?pin=3D938716279549=
2&amp;hs=3D0" style=3D"color:#20c;white-space:nowrap" target=3D"_blank">Mor=
e phone numbers</a></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;fo=
nt-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;wid=
th:90px" valign=3D"top"><div><i style=3D"font-style:normal">Calendar</i></d=
iv></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-=
size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1px">llvm@l=
ists.linux.dev</div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-fa=
mily:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90=
px" valign=3D"top"><div><i style=3D"font-style:normal">Who</i></div></td><t=
d style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;=
color:#222" valign=3D"top"><table cellspacing=3D"0" cellpadding=3D"0"><tr><=
td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;=
color:#222;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-=
family:Courier New,monospace">&#x2022;</span></div></td><td style=3D"paddin=
g-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div s=
tyle=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span item=
prop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span ite=
mprop=3D"name" class=3D"notranslate">Nick Desaulniers</span><meta itemprop=
=3D"email" content=3D"ndesaulniers@google.com"/></span><span itemprop=3D"or=
ganizer" itemscope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"=
name" content=3D"Nick Desaulniers"/><meta itemprop=3D"email" content=3D"nde=
saulniers@google.com"/></span><span style=3D"font-size:11px;color:#888"> - =
organizer</span></div></div></div></td></tr><tr><td style=3D"padding-right:=
10px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><di=
v style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospa=
ce">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-family:A=
rial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px">=
<div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscop=
e itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"no=
translate">Clang Built Linux</span><meta itemprop=3D"email" content=3D"clan=
g-built-linux@googlegroups.com"/></span></div></div></div></td></tr><tr><td=
 style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;co=
lor:#222;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-fa=
mily:Courier New,monospace">&#x2022;</span></div></td><td style=3D"padding-=
right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div sty=
le=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itempr=
op=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemp=
rop=3D"name" class=3D"notranslate">llvm@lists.linux.dev</span><meta itempro=
p=3D"email" content=3D"llvm@lists.linux.dev"/></span></div></div></div></td=
></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font=
-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><span sty=
le=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><td styl=
e=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#=
222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"=
><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person=
"><span itemprop=3D"name" class=3D"notranslate">jemarch@gnu.org</span><meta=
 itemprop=3D"email" content=3D"jemarch@gnu.org"/></span></div></div></div><=
/td></tr></table></td></tr></table><div style=3D"float:right;font-weight:bo=
ld;font-size:13px"> <a href=3D"https://calendar.google.com/calendar/event?a=
ction=3DVIEW&amp;eid=3DMGkwb2lkc2JtajdqdWllYW5namoxZDhmZDggbGx2bUBsaXN0cy5s=
aW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20zMDY0ZDI3ZTY4ZGU1Y=
jg2MTJlMmE2ODU4OWE3YTE4OTFjNzljMTUz&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">=
more details &raquo;</a><br></div><div style=3D"padding-bottom:15px;font-fa=
mily:Arial,Sans-serif;font-size:13px;color:#222;white-space:pre-wrap!import=
ant;white-space:-moz-pre-wrap!important;white-space:-pre-wrap!important;whi=
te-space:-o-pre-wrap!important;white-space:pre;word-wrap:break-word"><span>=
<a href=3D"https://www.google.com/url?q=3Dhttps%3A%2F%2Flinuxplumbersconf.o=
rg%2Fevent%2F11%2Fsessions%2F107%2F%2320210924&amp;sa=3DD&amp;ust=3D1630364=
043730000&amp;usg=3DAOvVaw0C23vwdHYSHK3MCzdcpAm0" target=3D"_blank">https:/=
/linuxplumbersconf.org/event/11/sessions/107/#20210924</a><br><a href=3D"ht=
tps://www.google.com/url?q=3Dhttps%3A%2F%2Flinuxplumbersconf.org%2Fevent%2F=
11%2Ftimetable%2F%23all&amp;sa=3DD&amp;ust=3D1630364043730000&amp;usg=3DAOv=
Vaw1VrHaVPhWpmEppwBxLQjTz" target=3D"_blank">https://linuxplumbersconf.org/=
event/11/timetable/#all</a></span><meta itemprop=3D"description" content=3D=
"https://linuxplumbersconf.org/event/11/sessions/107/#20210924
https://linuxplumbersconf.org/event/11/timetable/#all"/></div></div><p styl=
e=3D"color:#222;font-size:13px;margin:0"><span style=3D"color:#888">Going (=
llvm@lists.linux.dev)?&nbsp;&nbsp;&nbsp;</span><wbr><strong><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Yes=
"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpA=
ctionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReque=
stMethod/GET"/><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DMGkwb2lkc2JtajdqdWllYW5namoxZDhmZDggbGx2bUBsaXN0cy5saW=
51eC5kZXY&amp;rst=3D1&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20zMDY0ZDI=
3ZTY4ZGU1Yjg2MTJlMmE2ODU4OWE3YTE4OTFjNzljMTUz&amp;ctz=3DAmerica%2FLos_Angel=
es&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=
=3D"url">Yes</a></span></span><span style=3D"margin:0 0.4em;font-weight:nor=
mal"> - </span><span itemprop=3D"potentialaction" itemscope itemtype=3D"htt=
p://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://=
schema.org/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope item=
type=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=
=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://calendar.g=
oogle.com/calendar/event?action=3DRESPOND&amp;eid=3DMGkwb2lkc2JtajdqdWllYW5=
namoxZDhmZDggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D3&amp;tok=3DMjMjbmRlc2F1=
bG5pZXJzQGdvb2dsZS5jb20zMDY0ZDI3ZTY4ZGU1Yjg2MTJlMmE2ODU4OWE3YTE4OTFjNzljMTU=
z&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#2=
0c;white-space:nowrap" itemprop=3D"url">Maybe</a></span></span><span style=
=3D"margin:0 0.4em;font-weight:normal"> - </span><span itemprop=3D"potentia=
laction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=
=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"/><span item=
prop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"=
><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"=
/><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&am=
p;eid=3DMGkwb2lkc2JtajdqdWllYW5namoxZDhmZDggbGx2bUBsaXN0cy5saW51eC5kZXY&amp=
;rst=3D2&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20zMDY0ZDI3ZTY4ZGU1Yjg2=
MTJlMmE2ODU4OWE3YTE4OTFjNzljMTUz&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3De=
n&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">No</=
a></span></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a href=3D"https://ca=
lendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DMGkwb2lkc2JtajdqdW=
llYW5namoxZDhmZDggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJ=
zQGdvb2dsZS5jb20zMDY0ZDI3ZTY4ZGU1Yjg2MTJlMmE2ODU4OWE3YTE4OTFjNzljMTUz&amp;c=
tz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;whit=
e-space:nowrap" itemprop=3D"url">more options &raquo;</a></p></td></tr><tr>=
<td style=3D"background-color:#f6f6f6;color:#888;border-top:1px Solid #ccc;=
font-family:Arial,Sans-serif;font-size:11px"><p>Invitation from <a href=3D"=
https://calendar.google.com/calendar/" target=3D"_blank" style=3D"">Google =
Calendar</a></p><p>You are receiving this courtesy email at the account llv=
m@lists.linux.dev because you are an attendee of this event.</p><p>To stop =
receiving future updates for this event, decline this event. Alternatively =
you can sign up for a Google account at https://calendar.google.com/calenda=
r/ and control your notification settings for your entire calendar.</p><p>F=
orwarding this invitation could allow any recipient to send a response to t=
he organizer and be added to the guest list, or invite others regardless of=
 their own invitation status, or to modify your RSVP. <a href=3D"https://su=
pport.google.com/calendar/answer/37135#forwarding">Learn More</a>.</p></td>=
</tr></table></div></span></span>
--0000000000007a25d005ca6a2089
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20210924T140000Z
DTEND:20210924T180000Z
DTSTAMP:20210825T225403Z
ORGANIZER;CN=Nick Desaulniers:mailto:ndesaulniers@google.com
UID:0i0oidsbmj7juieangjj1d8fd8@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Clang Built Linux;X-NUM-GUESTS=0:mailto:clang-built-linux@googlegro
 ups.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=Nick Desaulniers;X-NUM-GUESTS=0:mailto:ndesaulniers@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=llvm@lists.linux.dev;X-NUM-GUESTS=0:mailto:llvm@lists.linux.dev
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=jemarch@gnu.org;X-NUM-GUESTS=0:mailto:jemarch@gnu.org
X-MICROSOFT-CDO-OWNERAPPTID:-883088066
CREATED:20210825T225401Z
DESCRIPTION:https://linuxplumbersconf.org/event/11/sessions/107/#20210924\n
 https://linuxplumbersconf.org/event/11/timetable/#all\n\n-::~:~::~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nDo n
 ot edit this section of the description.\n\nThis event has a video call.\nJ
 oin: https://meet.google.com/nug-ienp-dtk\n(US) +1 401-830-3337 PIN: 583983
 966#\nView more phone numbers: https://tel.meet/nug-ienp-dtk?pin=9387162795
 492&hs=7\n\nView your event at https://calendar.google.com/calendar/event?a
 ction=VIEW&eid=MGkwb2lkc2JtajdqdWllYW5namoxZDhmZDggbGx2bUBsaXN0cy5saW51eC5k
 ZXY&tok=MjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20zMDY0ZDI3ZTY4ZGU1Yjg2MTJlMmE2ODU
 4OWE3YTE4OTFjNzljMTUz&ctz=America%2FLos_Angeles&hl=en&es=1.\n-::~:~::~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20210825T225402Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000007a25d005ca6a2089--
--0000000000007a25d105ca6a208b
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjEwOTI0VDE0MDAwMFoNCkRURU5EOjIwMjEwOTI0
VDE4MDAwMFoNCkRUU1RBTVA6MjAyMTA4MjVUMjI1NDAzWg0KT1JHQU5JWkVSO0NOPU5pY2sgRGVz
YXVsbmllcnM6bWFpbHRvOm5kZXNhdWxuaWVyc0Bnb29nbGUuY29tDQpVSUQ6MGkwb2lkc2Jtajdq
dWllYW5namoxZDhmZDhAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9M
RT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1D
bGFuZyBCdWlsdCBMaW51eDtYLU5VTS1HVUVTVFM9MDptYWlsdG86Y2xhbmctYnVpbHQtbGludXhA
Z29vZ2xlZ3JvDQogdXBzLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEt
UEFSVElDSVBBTlQ7UEFSVFNUQVQ9QUNDRVBURUQ7UlNWUD1UUlVFDQogO0NOPU5pY2sgRGVzYXVs
bmllcnM7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm5kZXNhdWxuaWVyc0Bnb29nbGUuY29tDQpBVFRF
TkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVE
Uy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPWxsdm1AbGlzdHMubGludXguZGV2O1gtTlVNLUdVRVNU
Uz0wOm1haWx0bzpsbHZtQGxpc3RzLmxpbnV4LmRldg0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURV
QUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJV
RTtDTj1qZW1hcmNoQGdudS5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmplbWFyY2hAZ251Lm9y
Zw0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOi04ODMwODgwNjYNCkNSRUFURUQ6MjAyMTA4
MjVUMjI1NDAxWg0KREVTQ1JJUFRJT046aHR0cHM6Ly9saW51eHBsdW1iZXJzY29uZi5vcmcvZXZl
bnQvMTEvc2Vzc2lvbnMvMTA3LyMyMDIxMDkyNFxuDQogaHR0cHM6Ly9saW51eHBsdW1iZXJzY29u
Zi5vcmcvZXZlbnQvMTEvdGltZXRhYmxlLyNhbGxcblxuLTo6fjp+Ojp+On46fjp+On46DQogfjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjo6fjp+OjotXG5EbyBuDQogb3QgZWRpdCB0aGlzIHNlY3Rpb24gb2YgdGhlIGRlc2NyaXB0aW9u
LlxuXG5UaGlzIGV2ZW50IGhhcyBhIHZpZGVvIGNhbGwuXG5KDQogb2luOiBodHRwczovL21lZXQu
Z29vZ2xlLmNvbS9udWctaWVucC1kdGtcbihVUykgKzEgNDAxLTgzMC0zMzM3IFBJTjogNTgzOTgz
DQogOTY2I1xuVmlldyBtb3JlIHBob25lIG51bWJlcnM6IGh0dHBzOi8vdGVsLm1lZXQvbnVnLWll
bnAtZHRrP3Bpbj05Mzg3MTYyNzk1DQogNDkyJmhzPTdcblxuVmlldyB5b3VyIGV2ZW50IGF0IGh0
dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9hDQogY3Rpb249VklFVyZl
aWQ9TUdrd2IybGtjMkp0YWpkcWRXbGxZVzVuYW1veFpEaG1aRGdnYkd4MmJVQnNhWE4wY3k1c2FX
NTFlQzVrDQogWlhZJnRvaz1Nak1qYm1SbGMyRjFiRzVwWlhKelFHZHZiMmRzWlM1amIyMHpNRFkw
WkRJM1pUWTRaR1UxWWpnMk1USmxNbUUyT0RVDQogNE9XRTNZVEU0T1RGak56bGpNVFV6JmN0ej1B
bWVyaWNhJTJGTG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MS5cbi06On46fjo6fjp+On46DQogfjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46On46fjo6LQ0KTEFTVC1NT0RJRklFRDoyMDIxMDgyNVQyMjU0MDJaDQpMT0NBVElPTjoNClNF
UVVFTkNFOjANClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6DQpUUkFOU1A6T1BBUVVFDQpFTkQ6
VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--0000000000007a25d105ca6a208b--
