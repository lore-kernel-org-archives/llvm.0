Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B03FD0
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 22:38:45 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id s204-20020a252cd5000000b005a16e62ee63so928368ybs.12
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 15:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:reply-to:sender:message-id:date:subject:from:to;
        bh=V5jRF+XXRa6lfIx6mlpVnNRkKrU5RrV7G8Z7c+jhmKY=;
        b=J7RbHEfzqCzRR6uOvRdf37B6LZG6HVQzI3Y2FS6GimK038e5rtNXNN9mcFvcLI2Lcn
         lBkgjXj+rICqTfsyAoKD5xc8b/gV0wwdg5dcepOTf4xfvwvbhkZv7NUvqJJJN/qX+qiD
         NqajFqjfSAR1h486PYvwRZgByx3tzjISQdUywBqY+iRqf1BiSqhLBXU55nwZdC87HtEu
         Z5UQAR7bp4e2XVcocBeIoqgj1aEqdOf+ZPX+EqRGHH5Ipi7yPWUiJbIFsp3ELVChQuHp
         ckMd+3BvpVDnwZzIb3U9R9l8qBR5pMMnRO8vu2hfLD+HgmxH9Gmyx9vL13ULWtk1d7h2
         +iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
         :subject:from:to;
        bh=V5jRF+XXRa6lfIx6mlpVnNRkKrU5RrV7G8Z7c+jhmKY=;
        b=lToF7Pvz8cVASVv6LyMoOMceO0b243DF4M7v05wwSkwX4f9rzuB5+d7uMr4EXKw27R
         7IPy2qEvKoRRgAjAdyOzFphrad7KY+OS2TSY2x0Z/Lozc/NHMns7yjeUC4GqgkJMQIXS
         jLcTKZcDZGZKIHKeJOI0tu51XHKfMOPHzYiFqqhb/iaeGSIK3c0l2OCzoXga5C9dllvr
         xwf8exxn1OoUc1IgtEaVzZzTz+x9WOQJaqjZIEUoYjKv+PVhIvphoVnN5Am51WI9dfun
         ssx0qCneod59m92pQ3DWtnKvDPvDhSnxKlXVYphqJL7lMDmWvnSYDPx2GcTJ1G7rgHsN
         reiw==
X-Gm-Message-State: AOAM533LFgPDUmJ6WgoLKmTiH3cCscLEiK9kHkWAXUUMpQgSDw76+Aeq
	PZZBIrXVLiogFGFoXxRsvVugd/yDCr6cSnlawYYSJ6HbBjXkkzqd2CfROZpBcgAt6b+/py71YkD
	X90ZTfQcUAT6fFTPADB/UkToZ8bfH0YajhxDAOd1vSAZidsGXESsRDLo2aHqenhUUXQfhExoNG1
	ZW9ho=
X-Google-Smtp-Source: ABdhPJzZUWwleYronQ2df3mUFsZcMeML31kM4AjVKkEPgvR7TwvD5sPCpEwJNgPwzQRnmo/MiHFGzx8v3kypNGt5y11q
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a25:c08f:: with SMTP id c137mr1948400ybf.372.1631659124758;
 Tue, 14 Sep 2021 15:38:44 -0700 (PDT)
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <00000000000087362f05cbfc3e71@google.com>
Date: Tue, 14 Sep 2021 22:38:44 +0000
Subject: Invitation: Clang Built Linux Meetup II turbo (2021) @ Fri Sep 17,
 2021 8am - 2pm (PDT) (llvm@lists.linux.dev)
From: Nick Desaulniers <ndesaulniers@google.com>
To: llvm@lists.linux.dev, 
	Clang Built Linux <clang-built-linux@googlegroups.com>, Kees Cook <keescook@chromium.org>, 
	Bill Wendling <morbo@google.com>, masahiroy@kernel.org, Arnd Bergmann <arnd@linaro.org>, 
	clang linux fellowship <clang-linux-fellowship@google.com>, broonie@kernel.org
Content-Type: multipart/mixed; boundary="00000000000087360105cbfc3e70"

--00000000000087360105cbfc3e70
Content-Type: multipart/alternative; boundary="0000000000008735fe05cbfc3e6e"

--0000000000008735fe05cbfc3e6e
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WW91IGhhdmUgYmVlbiBpbnZpdGVkIHRvIHRoZSBmb2xsb3dpbmcgZXZlbnQuDQoNClRpdGxlOiBD
bGFuZyBCdWlsdCBMaW51eCBNZWV0dXAgSUkgdHVyYm8gKDIwMjEpDQpodHRwczovL2dpdGh1Yi5j
b20vQ2xhbmdCdWlsdExpbnV4L0NCTC1tZWV0dXAtSUktdHVyYm8NCldoZW46IEZyaSBTZXAgMTcs
IDIwMjEgOGFtIOKAkyAycG0gUGFjaWZpYyBUaW1lIC0gTG9zIEFuZ2VsZXMNCg0KSm9pbmluZyBp
bmZvOiBKb2luIHdpdGggR29vZ2xlIE1lZXQNCmh0dHBzOi8vbWVldC5nb29nbGUuY29tL2FmYS1y
d3VxLWNqdz9ocz0yMjQNCg0KSm9pbiBieSBwaG9uZQ0KKFVTKSArMSAzMDQtODM3LTIxMjEgKFBJ
TjogNzU0MDg1NjI2KQ0KDQpNb3JlIHBob25lIG51bWJlcnM6IGh0dHBzOi8vdGVsLm1lZXQvYWZh
LXJ3dXEtY2p3P3Bpbj03Mjk5MjczMzUzNjUwJmhzPTANCg0KQ2FsZW5kYXI6IGxsdm1AbGlzdHMu
bGludXguZGV2DQpXaG86DQogICAgICogTmljayBEZXNhdWxuaWVycyAtIG9yZ2FuaXplcg0KICAg
ICAqIENsYW5nIEJ1aWx0IExpbnV4DQogICAgICogS2VlcyBDb29rDQogICAgICogQmlsbCBXZW5k
bGluZw0KICAgICAqIG1hc2FoaXJveUBrZXJuZWwub3JnDQogICAgICogQXJuZCBCZXJnbWFubg0K
ICAgICAqIGxsdm1AbGlzdHMubGludXguZGV2DQogICAgICogY2xhbmcgbGludXggZmVsbG93c2hp
cA0KICAgICAqIGJyb29uaWVAa2VybmVsLm9yZw0KDQpFdmVudCBkZXRhaWxzOiAgDQpodHRwczov
L2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU0zTmhh
RzAzYkhOdloyWm1kRGhzY21SMGNHazNNemxqY25VZ2JHeDJiVUJzYVhOMGN5NXNhVzUxZUM1a1pY
WSZ0b2s9TWpNamJtUmxjMkYxYkc1cFpYSnpRR2R2YjJkc1pTNWpiMjA1TVdSa1pqZzBOemxsT1Rr
M05ERTRZemRoT0dRM09UTmxOR1ZqTXpFMFlXTXdaREUyWkRWaCZjdHo9QW1lcmljYSUyRkxvc19B
bmdlbGVzJmhsPWVuJmVzPTANCg0KSW52aXRhdGlvbiBmcm9tIEdvb2dsZSBDYWxlbmRhcjogaHR0
cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0
aGlzIGNvdXJ0ZXN5IGVtYWlsIGF0IHRoZSBhY2NvdW50IGxsdm1AbGlzdHMubGludXguZGV2ICAN
CmJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvZiB0aGlzIGV2ZW50Lg0KDQpUbyBzdG9wIHJl
Y2VpdmluZyBmdXR1cmUgdXBkYXRlcyBmb3IgdGhpcyBldmVudCwgZGVjbGluZSB0aGlzIGV2ZW50
LiAgDQpBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gc2lnbiB1cCBmb3IgYSBHb29nbGUgYWNjb3VudCBh
dCAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvIGFuZCBjb250cm9sIHlv
dXIgbm90aWZpY2F0aW9uICANCnNldHRpbmdzIGZvciB5b3VyIGVudGlyZSBjYWxlbmRhci4NCg0K
Rm9yd2FyZGluZyB0aGlzIGludml0YXRpb24gY291bGQgYWxsb3cgYW55IHJlY2lwaWVudCB0byBz
ZW5kIGEgcmVzcG9uc2UgdG8gIA0KdGhlIG9yZ2FuaXplciBhbmQgYmUgYWRkZWQgdG8gdGhlIGd1
ZXN0IGxpc3QsIG9yIGludml0ZSBvdGhlcnMgcmVnYXJkbGVzcyAgDQpvZiB0aGVpciBvd24gaW52
aXRhdGlvbiBzdGF0dXMsIG9yIHRvIG1vZGlmeSB5b3VyIFJTVlAuIExlYXJuIG1vcmUgYXQgIA0K
aHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2FsZW5kYXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRp
bmcNCg==
--0000000000008735fe05cbfc3e6e
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
alendar" content=3D"3sahm7lsogfft8lrdtpi739cru"/><h3 style=3D"padding:0 0 6=
px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:bold;=
color:#222"><span itemprop=3D"name">Clang Built Linux Meetup II turbo (2021=
)</span></h3><table style=3D"display:inline-table" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" summary=3D"Event details"><tr><td style=3D"padding=
:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-=
space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:normal"=
>When</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans=
-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:=
-1px"><time itemprop=3D"startDate" datetime=3D"20210917T150000Z"></time><ti=
me itemprop=3D"endDate" datetime=3D"20210917T210000Z"></time>Fri Sep 17, 20=
21 8am =E2=80=93 2pm <span style=3D"color:#888">Pacific Time - Los Angeles<=
/span></div></td></tr><tr><td style=3D"padding:0 1em 4px 0;font-family:Aria=
l,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" valig=
n=3D"top"><div><i style=3D"font-style:normal">Joining info</i></div></td><t=
d style=3D"padding-bottom:4px;font-family:Arial,Sans-serif;font-size:13px;c=
olor:#222" valign=3D"top"><div style=3D"text-indent:-1px">Join with Google =
Meet</div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial=
,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px"></td><=
td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px=
;color:#222" valign=3D"top"><div style=3D"text-indent:-1px"><div style=3D"t=
ext-indent:-1px"><span itemprop=3D"potentialaction" itemscope itemtype=3D"h=
ttp://schema.org/JoinAction"><span itemprop=3D"name" content=3D"meet.google=
.com/afa-rwuq-cjw"><span itemprop=3D"target" itemscope itemtype=3D"http://s=
chema.org/EntryPoint"><span itemprop=3D"url" content=3D"https://meet.google=
.com/afa-rwuq-cjw?hs=3D224"><span itemprop=3D"httpMethod" content=3D"GET"><=
a href=3D"https://meet.google.com/afa-rwuq-cjw?hs=3D224" style=3D"color:#20=
c;white-space:nowrap" target=3D"_blank">meet.google.com/afa-rwuq-cjw</a></s=
pan></span></span></span></span> </div></div></td></tr><tr><td style=3D"pad=
ding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;wh=
ite-space:nowrap;width:90px"></td><td style=3D"padding-bottom:10px;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"></td></tr><t=
d style=3D"padding:0 1em 4px 0;font-family:Arial,Sans-serif;font-size:13px;=
color:#888;white-space:nowrap;width:90px"></td><td style=3D"padding-bottom:=
4px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top">=
<div style=3D"text-indent:-1px">Join by phone</div></td><tr><td style=3D"pa=
dding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;w=
hite-space:nowrap;width:90px"></td><td style=3D"padding-bottom:10px;font-fa=
mily:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=
=3D"text-indent:-1px"><div style=3D"text-indent:-1px"><span style=3D"color:=
#888">(US) </span><a href=3D"tel:+1-304-837-2121;754085626#" style=3D"color=
:#20c;white-space:nowrap" target=3D"_blank">+1 304-837-2121</a> <span style=
=3D"color:#888">(PIN: 754085626)</span></div></div></td></tr><tr><td style=
=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:=
#888;white-space:nowrap;width:90px"></td><td style=3D"padding-bottom:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"></td>=
</tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;fon=
t-size:13px;color:#888;white-space:nowrap;width:90px"></td><td style=3D"pad=
ding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" va=
lign=3D"top"><div style=3D"text-indent:-1px"><a href=3D"https://tel.meet/af=
a-rwuq-cjw?pin=3D7299273353650&amp;hs=3D0" style=3D"color:#20c;white-space:=
nowrap" target=3D"_blank">More phone numbers</a></div></td></tr><tr><td sty=
le=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-=
style:normal">Calendar</i></div></td><td style=3D"padding-bottom:10px;font-=
family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div styl=
e=3D"text-indent:-1px">llvm@lists.linux.dev</div></td></tr><tr><td style=3D=
"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#88=
8;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style=
:normal">Who</i></div></td><td style=3D"padding-bottom:10px;font-family:Ari=
al,Sans-serif;font-size:13px;color:#222" valign=3D"top"><table cellspacing=
=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-right:10px;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-ind=
ent:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</span>=
</div></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;fon=
t-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"=
margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http:=
//schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">Nick Des=
aulniers</span><meta itemprop=3D"email" content=3D"ndesaulniers@google.com"=
/></span><span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.o=
rg/Person"><meta itemprop=3D"name" content=3D"Nick Desaulniers"/><meta item=
prop=3D"email" content=3D"ndesaulniers@google.com"/></span><span style=3D"f=
ont-size:11px;color:#888"> - organizer</span></div></div></div></td></tr><t=
r><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13=
px;color:#222;width:10px"><div style=3D"text-indent:-1px"><span style=3D"fo=
nt-family:Courier New,monospace">&#x2022;</span></div></td><td style=3D"pad=
ding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><di=
v style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span i=
temprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span =
itemprop=3D"name" class=3D"notranslate">Clang Built Linux</span><meta itemp=
rop=3D"email" content=3D"clang-built-linux@googlegroups.com"/></span></div>=
</div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:Arial=
,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-indent=
:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</span></d=
iv></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-s=
ize:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"mar=
gin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://s=
chema.org/Person"><span itemprop=3D"name" class=3D"notranslate">Kees Cook</=
span><meta itemprop=3D"email" content=3D"keescook@chromium.org"/></span></d=
iv></div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-ind=
ent:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</span>=
</div></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;fon=
t-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"=
margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http:=
//schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">Bill Wen=
dling</span><meta itemprop=3D"email" content=3D"morbo@google.com"/></span><=
/div></div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:=
Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-i=
ndent:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</spa=
n></div></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;f=
ont-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=
=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"h=
ttp://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">masa=
hiroy@kernel.org</span><meta itemprop=3D"email" content=3D"masahiroy@kernel=
.org"/></span></div></div></div></td></tr><tr><td style=3D"padding-right:10=
px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div =
style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace=
">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-family:Ari=
al,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><d=
iv><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope =
itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notr=
anslate">Arnd Bergmann</span><meta itemprop=3D"email" content=3D"arnd@linar=
o.org"/></span></div></div></div></td></tr><tr><td style=3D"padding-right:1=
0px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div=
 style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospac=
e">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><=
div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope=
 itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"not=
ranslate">llvm@lists.linux.dev</span><meta itemprop=3D"email" content=3D"ll=
vm@lists.linux.dev"/></span></div></div></div></td></tr><tr><td style=3D"pa=
dding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222;wid=
th:10px"><div style=3D"text-indent:-1px"><span style=3D"font-family:Courier=
 New,monospace">&#x2022;</span></div></td><td style=3D"padding-right:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-i=
ndent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attend=
ee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name"=
 class=3D"notranslate">clang linux fellowship</span><meta itemprop=3D"email=
" content=3D"clang-linux-fellowship@google.com"/></span></div></div></div><=
/td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;f=
ont-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><span =
style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><td s=
tyle=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;colo=
r:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em=
 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Per=
son"><span itemprop=3D"name" class=3D"notranslate">broonie@kernel.org</span=
><meta itemprop=3D"email" content=3D"broonie@kernel.org"/></span></div></di=
v></div></td></tr></table></td></tr></table><div style=3D"float:right;font-=
weight:bold;font-size:13px"> <a href=3D"https://calendar.google.com/calenda=
r/event?action=3DVIEW&amp;eid=3DM3NhaG03bHNvZ2ZmdDhscmR0cGk3MzljcnUgbGx2bUB=
saXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb205MWRkZjg0=
NzllOTk3NDE4YzdhOGQ3OTNlNGVjMzE0YWMwZDE2ZDVh&amp;ctz=3DAmerica%2FLos_Angele=
s&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=
=3D"url">more details &raquo;</a><br></div><div style=3D"padding-bottom:15p=
x;font-family:Arial,Sans-serif;font-size:13px;color:#222;white-space:pre-wr=
ap!important;white-space:-moz-pre-wrap!important;white-space:-pre-wrap!impo=
rtant;white-space:-o-pre-wrap!important;white-space:pre;word-wrap:break-wor=
d"><span><a href=3D"https://www.google.com/url?q=3Dhttps%3A%2F%2Fgithub.com=
%2FClangBuiltLinux%2FCBL-meetup-II-turbo&amp;sa=3DD&amp;ust=3D1632091124740=
000&amp;usg=3DAOvVaw2HF4GbQ8yhQmEWtz650Fle" target=3D"_blank">https://githu=
b.com/ClangBuiltLinux/CBL-meetup-II-turbo</a></span><meta itemprop=3D"descr=
iption" content=3D"https://github.com/ClangBuiltLinux/CBL-meetup-II-turbo"/=
></div></div><p style=3D"color:#222;font-size:13px;margin:0"><span style=3D=
"color:#888">Going (llvm@lists.linux.dev)?&nbsp;&nbsp;&nbsp;</span><wbr><st=
rong><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema=
.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org=
/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope itemtype=3D"http=
://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://s=
chema.org/HttpRequestMethod/GET"/><a href=3D"https://calendar.google.com/ca=
lendar/event?action=3DRESPOND&amp;eid=3DM3NhaG03bHNvZ2ZmdDhscmR0cGk3MzljcnU=
gbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D1&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdv=
b2dsZS5jb205MWRkZjg0NzllOTk3NDE4YzdhOGQ3OTNlNGVjMzE0YWMwZDE2ZDVh&amp;ctz=3D=
America%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-spa=
ce:nowrap" itemprop=3D"url">Yes</a></span></span><span style=3D"margin:0 0.=
4em;font-weight:normal"> - </span><span itemprop=3D"potentialaction" itemsc=
ope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance"=
 content=3D"http://schema.org/RsvpAttendance/Maybe"/><span itemprop=3D"hand=
ler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><link itemp=
rop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D=
"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DM3Nh=
aG03bHNvZ2ZmdDhscmR0cGk3MzljcnUgbGx2bUBsaXN0cy5saW51eC5kZXY&amp;rst=3D3&amp=
;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb205MWRkZjg0NzllOTk3NDE4YzdhOGQ3OTNl=
NGVjMzE0YWMwZDE2ZDVh&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0=
" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">Maybe</a></span>=
</span><span style=3D"margin:0 0.4em;font-weight:normal"> - </span><span it=
emprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpActi=
on"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendan=
ce/No"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/=
HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/Http=
RequestMethod/GET"/><a href=3D"https://calendar.google.com/calendar/event?a=
ction=3DRESPOND&amp;eid=3DM3NhaG03bHNvZ2ZmdDhscmR0cGk3MzljcnUgbGx2bUBsaXN0c=
y5saW51eC5kZXY&amp;rst=3D2&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb205MW=
RkZjg0NzllOTk3NDE4YzdhOGQ3OTNlNGVjMzE0YWMwZDE2ZDVh&amp;ctz=3DAmerica%2FLos_=
Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" ite=
mprop=3D"url">No</a></span></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a =
href=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3D=
M3NhaG03bHNvZ2ZmdDhscmR0cGk3MzljcnUgbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DM=
jMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb205MWRkZjg0NzllOTk3NDE4YzdhOGQ3OTNlNGVjMzE0=
YWMwZDE2ZDVh&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=
=3D"color:#20c;white-space:nowrap" itemprop=3D"url">more options &raquo;</a=
></p></td></tr><tr><td style=3D"background-color:#f6f6f6;color:#888;border-=
top:1px Solid #ccc;font-family:Arial,Sans-serif;font-size:11px"><p>Invitati=
on from <a href=3D"https://calendar.google.com/calendar/" target=3D"_blank"=
 style=3D"">Google Calendar</a></p><p>You are receiving this courtesy email=
 at the account llvm@lists.linux.dev because you are an attendee of this ev=
ent.</p><p>To stop receiving future updates for this event, decline this ev=
ent. Alternatively you can sign up for a Google account at https://calendar=
.google.com/calendar/ and control your notification settings for your entir=
e calendar.</p><p>Forwarding this invitation could allow any recipient to s=
end a response to the organizer and be added to the guest list, or invite o=
thers regardless of their own invitation status, or to modify your RSVP. <a=
 href=3D"https://support.google.com/calendar/answer/37135#forwarding">Learn=
 More</a>.</p></td></tr></table></div></span></span>
--0000000000008735fe05cbfc3e6e
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20210917T150000Z
DTEND:20210917T210000Z
DTSTAMP:20210914T223844Z
ORGANIZER;CN=Nick Desaulniers:mailto:ndesaulniers@google.com
UID:3sahm7lsogfft8lrdtpi739cru@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Clang Built Linux;X-NUM-GUESTS=0:mailto:clang-built-linux@googlegro
 ups.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Kees Cook;X-NUM-GUESTS=0:mailto:keescook@chromium.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=Nick Desaulniers;X-NUM-GUESTS=0:mailto:ndesaulniers@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Bill Wendling;X-NUM-GUESTS=0:mailto:morbo@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=masahiroy@kernel.org;X-NUM-GUESTS=0:mailto:masahiroy@kernel.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Arnd Bergmann;X-NUM-GUESTS=0:mailto:arnd@linaro.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=llvm@lists.linux.dev;X-NUM-GUESTS=0:mailto:llvm@lists.linux.dev
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=clang linux fellowship;X-NUM-GUESTS=0:mailto:clang-linux-fellowship
 @google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=broonie@kernel.org;X-NUM-GUESTS=0:mailto:broonie@kernel.org
X-MICROSOFT-CDO-OWNERAPPTID:1293796827
CREATED:20210914T223841Z
DESCRIPTION:https://github.com/ClangBuiltLinux/CBL-meetup-II-turbo\n\n-::~:
 ~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 :~:~::-\nDo not edit this section of the description.\n\nThis event has a v
 ideo call.\nJoin: https://meet.google.com/afa-rwuq-cjw\n(US) +1 304-837-212
 1 PIN: 754085626#\nView more phone numbers: https://tel.meet/afa-rwuq-cjw?p
 in=7299273353650&hs=7\n\nView your event at https://calendar.google.com/cal
 endar/event?action=VIEW&eid=M3NhaG03bHNvZ2ZmdDhscmR0cGk3MzljcnUgbGx2bUBsaXN
 0cy5saW51eC5kZXY&tok=MjMjbmRlc2F1bG5pZXJzQGdvb2dsZS5jb205MWRkZjg0NzllOTk3ND
 E4YzdhOGQ3OTNlNGVjMzE0YWMwZDE2ZDVh&ctz=America%2FLos_Angeles&hl=en&es=1.\n-
 ::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~::~:~::-
LAST-MODIFIED:20210914T223843Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:Clang Built Linux Meetup II turbo (2021)
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000008735fe05cbfc3e6e--
--00000000000087360105cbfc3e70
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjEwOTE3VDE1MDAwMFoNCkRURU5EOjIwMjEwOTE3
VDIxMDAwMFoNCkRUU1RBTVA6MjAyMTA5MTRUMjIzODQ0Wg0KT1JHQU5JWkVSO0NOPU5pY2sgRGVz
YXVsbmllcnM6bWFpbHRvOm5kZXNhdWxuaWVyc0Bnb29nbGUuY29tDQpVSUQ6M3NhaG03bHNvZ2Zm
dDhscmR0cGk3MzljcnVAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9M
RT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1D
bGFuZyBCdWlsdCBMaW51eDtYLU5VTS1HVUVTVFM9MDptYWlsdG86Y2xhbmctYnVpbHQtbGludXhA
Z29vZ2xlZ3JvDQogdXBzLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEt
UEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1LZWVzIENv
b2s7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmtlZXNjb29rQGNocm9taXVtLm9yZw0KQVRURU5ERUU7
Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9QUNDRVBURUQ7
UlNWUD1UUlVFDQogO0NOPU5pY2sgRGVzYXVsbmllcnM7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm5k
ZXNhdWxuaWVyc0Bnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJF
US1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUJpbGwg
V2VuZGxpbmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm1vcmJvQGdvb2dsZS5jb20NCkFUVEVOREVF
O0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFD
VElPTjtSU1ZQPQ0KIFRSVUU7Q049bWFzYWhpcm95QGtlcm5lbC5vcmc7WC1OVU0tR1VFU1RTPTA6
bWFpbHRvOm1hc2FoaXJveUBrZXJuZWwub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtS
T0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NO
PUFybmQgQmVyZ21hbm47WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmFybmRAbGluYXJvLm9yZw0KQVRU
RU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVF
RFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1sbHZtQGxpc3RzLmxpbnV4LmRldjtYLU5VTS1HVUVT
VFM9MDptYWlsdG86bGx2bUBsaXN0cy5saW51eC5kZXYNCkFUVEVOREVFO0NVVFlQRT1JTkRJVklE
VUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRS
VUU7Q049Y2xhbmcgbGludXggZmVsbG93c2hpcDtYLU5VTS1HVUVTVFM9MDptYWlsdG86Y2xhbmct
bGludXgtZmVsbG93c2hpcA0KIEBnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVB
TDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVF
O0NOPWJyb29uaWVAa2VybmVsLm9yZztYLU5VTS1HVUVTVFM9MDptYWlsdG86YnJvb25pZUBrZXJu
ZWwub3JnDQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBUSUQ6MTI5Mzc5NjgyNw0KQ1JFQVRFRDoy
MDIxMDkxNFQyMjM4NDFaDQpERVNDUklQVElPTjpodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWls
dExpbnV4L0NCTC1tZWV0dXAtSUktdHVyYm9cblxuLTo6fjoNCiB+Ojp+On46fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjoN
CiA6fjp+OjotXG5EbyBub3QgZWRpdCB0aGlzIHNlY3Rpb24gb2YgdGhlIGRlc2NyaXB0aW9uLlxu
XG5UaGlzIGV2ZW50IGhhcyBhIHYNCiBpZGVvIGNhbGwuXG5Kb2luOiBodHRwczovL21lZXQuZ29v
Z2xlLmNvbS9hZmEtcnd1cS1jandcbihVUykgKzEgMzA0LTgzNy0yMTINCiAxIFBJTjogNzU0MDg1
NjI2I1xuVmlldyBtb3JlIHBob25lIG51bWJlcnM6IGh0dHBzOi8vdGVsLm1lZXQvYWZhLXJ3dXEt
Y2p3P3ANCiBpbj03Mjk5MjczMzUzNjUwJmhzPTdcblxuVmlldyB5b3VyIGV2ZW50IGF0IGh0dHBz
Oi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWwNCiBlbmRhci9ldmVudD9hY3Rpb249VklFVyZlaWQ9
TTNOaGFHMDNiSE52WjJabWREaHNjbVIwY0drM016bGpjblVnYkd4MmJVQnNhWE4NCiAwY3k1c2FX
NTFlQzVrWlhZJnRvaz1Nak1qYm1SbGMyRjFiRzVwWlhKelFHZHZiMmRzWlM1amIyMDVNV1JrWmpn
ME56bGxPVGszTkQNCiBFNFl6ZGhPR1EzT1RObE5HVmpNekUwWVdNd1pERTJaRFZoJmN0ej1BbWVy
aWNhJTJGTG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MS5cbi0NCiA6On46fjo6fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjoNCiB+
On46On46fjo6LQ0KTEFTVC1NT0RJRklFRDoyMDIxMDkxNFQyMjM4NDNaDQpMT0NBVElPTjoNClNF
UVVFTkNFOjANClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6Q2xhbmcgQnVpbHQgTGludXggTWVl
dHVwIElJIHR1cmJvICgyMDIxKQ0KVFJBTlNQOk9QQVFVRQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxF
TkRBUg0K
--00000000000087360105cbfc3e70--
