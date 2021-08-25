Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E742FAF
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 22:54:37 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id w2-20020a3794020000b02903b54f40b442so884961qkd.0
        for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 15:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:reply-to:sender:auto-submitted:message-id:date:subject
         :from:to;
        bh=YEaoQW0cStkrTQtmljf2rGR4Bub4BaiHCvbl1dfhAiw=;
        b=jRaGcCqDOzWSp6zZqo0l5q9FTmwaQcn8/KLipAbchtbJKFeodNrd0mdUWWuh4F+QoO
         pApyVkc5Sn/Sx17X8MMRgsJkUuzmU7DRGTbZZDLnZYkXHg6oXunjp0UUXeKblkTFMhPm
         YCF3iYbu0gu5Mt4Ka3HoWnxIWS0/Ew6/9KqUO9LYqYWLel9ThycMCudY1eqxij3C8z0a
         8sFczvZRlSTX4ane/uaIsESkJUvs1Vs3mfxXmToVK84gcJaKXLeL2qeG+xHTngw4/Ifc
         7qmpIOK6Ss07POYNBlS/yHWuxqaMoTfUdOOmMCLMVl2/0HTetnQwPaBFiG9k5ChhC05u
         ssQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:auto-submitted
         :message-id:date:subject:from:to;
        bh=YEaoQW0cStkrTQtmljf2rGR4Bub4BaiHCvbl1dfhAiw=;
        b=LZEAjNP2w0qW3Fc2SzqkT9IFTayC1yHvpeXUcBg6VHRuoL4TA3tsViOXWOxpJkr+El
         xYG7Rb82E9jEMO5kIZKEJmtoXvBjs7COUOqQktEabJblVupu5w4YYrc9TsEwH5PMLJcm
         3bj9o1QLN2nNtgshljaMLQv7kFKhaimTH5TXDvoF6R212jaAdofLqlLEqv0RGjHR/9a4
         gej/RvoldrlQipPE+hd6NSQam/t40kJkCJ0QHNdmb9FLWRPjH8epgr1bpPV2Ecfb08U8
         UWeiMWcbe9Az96Qtgd1AQjJn1s3Yyz2Gb0vxGJzR4bu7Tmf0XykUGYMCWctyYmxA4HmI
         3sdA==
X-Gm-Message-State: AOAM531EKa1mgGulSgVFZrJHtVb5rMkN2EcuMTSgvzcbat+F/2K5sqir
	ZO5FqtpFGJI6fMbLHZSD3ZBYhemYED1V8sQ9Qk9IrSv0T6lioydJtbwZAPuy+wnpvHVgsNs0PfX
	1P+qZ65PA6mEs5GMcSHhOhDG7NebSGYbNnVeKBy3hT2JYX990jcIKG4iblfBA2K65mQXjIQAnX0
	OYtHg=
X-Google-Smtp-Source: ABdhPJzTR48qxf489ZTyh0RUkhKWaeVw2Xq0uGkhNGuYAlCO7JHRL844hF7S3BjjGMpVJ6xAAby23UTHqRh4yF6NYCqh
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a37:9cca:: with SMTP id f193mr959445qke.368.1629932076579;
 Wed, 25 Aug 2021 15:54:36 -0700 (PDT)
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Sender: Google Calendar <calendar-notification@google.com>
Auto-Submitted: auto-generated
Message-ID: <0000000000006f244d05ca6a228f@google.com>
Date: Wed, 25 Aug 2021 22:54:36 +0000
Subject: Updated invitation with note: Toolchains and Kernel MC @ Fri Sep 24,
 2021 7am - 11am (PDT) (llvm@lists.linux.dev)
From: Nick Desaulniers <ndesaulniers@google.com>
To: llvm@lists.linux.dev, 
	Clang Built Linux <clang-built-linux@googlegroups.com>, jemarch@gnu.org
Content-Type: multipart/mixed; boundary="0000000000006f243305ca6a228e"

--0000000000006f243305ca6a228e
Content-Type: multipart/alternative; boundary="0000000000006f243105ca6a228c"

--0000000000006f243105ca6a228c
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjaGFuZ2VkIHdpdGggdGhpcyBub3RlOg0KImFkZCB0aXRsZSAi
VG9vbGNoYWlucyBhbmQgS2VybmVsIE1DIiINCg0KVGl0bGU6IFRvb2xjaGFpbnMgYW5kIEtlcm5l
bCBNQyAoY2hhbmdlZCkNCmh0dHBzOi8vbGludXhwbHVtYmVyc2NvbmYub3JnL2V2ZW50LzExL3Nl
c3Npb25zLzEwNy8jMjAyMTA5MjQNCmh0dHBzOi8vbGludXhwbHVtYmVyc2NvbmYub3JnL2V2ZW50
LzExL3RpbWV0YWJsZS8jYWxsDQpXaGVuOiBGcmkgU2VwIDI0LCAyMDIxIDdhbSDigJMgMTFhbSBQ
YWNpZmljIFRpbWUgLSBMb3MgQW5nZWxlcw0KDQpKb2luaW5nIGluZm86IEpvaW4gd2l0aCBHb29n
bGUgTWVldA0KaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vbnVnLWllbnAtZHRrP2hzPTIyNA0KDQpK
b2luIGJ5IHBob25lDQooVVMpICsxIDQwMS04MzAtMzMzNyAoUElOOiA1ODM5ODM5NjYpDQoNCk1v
cmUgcGhvbmUgbnVtYmVyczogaHR0cHM6Ly90ZWwubWVldC9udWctaWVucC1kdGs/cGluPTkzODcx
NjI3OTU0OTImaHM9MA0KDQpDYWxlbmRhcjogbGx2bUBsaXN0cy5saW51eC5kZXYNCldobzoNCiAg
ICAgKiBOaWNrIERlc2F1bG5pZXJzIC0gb3JnYW5pemVyDQogICAgICogQ2xhbmcgQnVpbHQgTGlu
dXgNCiAgICAgKiBsbHZtQGxpc3RzLmxpbnV4LmRldg0KICAgICAqIGplbWFyY2hAZ251Lm9yZw0K
DQpFdmVudCBkZXRhaWxzOiAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIv
ZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU1Ha3diMmxrYzJKdGFqZHFkV2xsWVc1bmFtb3haRGhtWkRn
Z2JHeDJiVUJzYVhOMGN5NXNhVzUxZUM1a1pYWSZ0b2s9TWpNamJtUmxjMkYxYkc1cFpYSnpRR2R2
YjJkc1pTNWpiMjB6TURZMFpESTNaVFk0WkdVMVlqZzJNVEpsTW1FMk9EVTRPV0UzWVRFNE9URmpO
emxqTVRVeiZjdHo9QW1lcmljYSUyRkxvc19BbmdlbGVzJmhsPWVuJmVzPTANCg0KSW52aXRhdGlv
biBmcm9tIEdvb2dsZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVu
ZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGNvdXJ0ZXN5IGVtYWlsIGF0IHRoZSBhY2Nv
dW50IGxsdm1AbGlzdHMubGludXguZGV2ICANCmJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBv
ZiB0aGlzIGV2ZW50Lg0KDQpUbyBzdG9wIHJlY2VpdmluZyBmdXR1cmUgdXBkYXRlcyBmb3IgdGhp
cyBldmVudCwgZGVjbGluZSB0aGlzIGV2ZW50LiAgDQpBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gc2ln
biB1cCBmb3IgYSBHb29nbGUgYWNjb3VudCBhdCAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5j
b20vY2FsZW5kYXIvIGFuZCBjb250cm9sIHlvdXIgbm90aWZpY2F0aW9uICANCnNldHRpbmdzIGZv
ciB5b3VyIGVudGlyZSBjYWxlbmRhci4NCg0KRm9yd2FyZGluZyB0aGlzIGludml0YXRpb24gY291
bGQgYWxsb3cgYW55IHJlY2lwaWVudCB0byBzZW5kIGEgcmVzcG9uc2UgdG8gIA0KdGhlIG9yZ2Fu
aXplciBhbmQgYmUgYWRkZWQgdG8gdGhlIGd1ZXN0IGxpc3QsIG9yIGludml0ZSBvdGhlcnMgcmVn
YXJkbGVzcyAgDQpvZiB0aGVpciBvd24gaW52aXRhdGlvbiBzdGF0dXMsIG9yIHRvIG1vZGlmeSB5
b3VyIFJTVlAuIExlYXJuIG1vcmUgYXQgIA0KaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2Fs
ZW5kYXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--0000000000006f243105ca6a228c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span style=3D"=
display:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Th=
ing/Paragraph"><meta itemprop=3D"description" content=3D"Title updated"/></=
span><span itemprop=3D"object" itemscope itemtype=3D"http://schema.org/Even=
t"><div style=3D""><table cellspacing=3D"0" cellpadding=3D"8" border=3D"0" =
summary=3D"" style=3D"width:100%;font-family:Arial,Sans-serif;border:1px So=
lid #ccc;border-width:1px 2px 2px 1px;background-color:#fff;"><tr><td><meta=
 itemprop=3D"eventStatus" content=3D"http://schema.org/EventRescheduled"/><=
h4 style=3D"padding:6px 0;margin:0 0 4px 0;font-family:Arial,Sans-serif;fon=
t-size:13px;line-height:1.4;border:1px Solid #fff;background:#fff;color:#09=
0;font-weight:normal"><strong>This event has been changed with this note:</=
strong><br>"add title &quot;Toolchains and Kernel MC&quot;"</h4><div style=
=3D"padding:2px"><span itemprop=3D"publisher" itemscope itemtype=3D"http://=
schema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calendar=
"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"0i0oidsbmj7j=
uieangjj1d8fd8"/><h3 style=3D"padding:0 0 6px 0;margin:0;font-family:Arial,=
Sans-serif;font-size:16px;font-weight:bold;color:#222"><strong style=3D"col=
or:#080">Changed: </strong><span itemprop=3D"name">Toolchains and Kernel MC=
</span></h3><table style=3D"display:inline-table" cellpadding=3D"0" cellspa=
cing=3D"0" border=3D"0" summary=3D"Event details"><tr><td style=3D"padding:=
0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-s=
pace:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:normal">=
When</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-=
serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-=
1px"><time itemprop=3D"startDate" datetime=3D"20210924T140000Z"></time><tim=
e itemprop=3D"endDate" datetime=3D"20210924T180000Z"></time>Fri Sep 24, 202=
1 7am =E2=80=93 11am <span style=3D"color:#888">Pacific Time - Los Angeles<=
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
.com/nug-ienp-dtk"><span itemprop=3D"target" itemscope itemtype=3D"http://s=
chema.org/EntryPoint"><span itemprop=3D"url" content=3D"https://meet.google=
.com/nug-ienp-dtk?hs=3D224"><span itemprop=3D"httpMethod" content=3D"GET"><=
a href=3D"https://meet.google.com/nug-ienp-dtk?hs=3D224" style=3D"color:#20=
c;white-space:nowrap" target=3D"_blank">meet.google.com/nug-ienp-dtk</a></s=
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
#888">(US) </span><a href=3D"tel:+1-401-830-3337;583983966#" style=3D"color=
:#20c;white-space:nowrap" target=3D"_blank">+1 401-830-3337</a> <span style=
=3D"color:#888">(PIN: 583983966)</span></div></div></td></tr><tr><td style=
=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:=
#888;white-space:nowrap;width:90px"></td><td style=3D"padding-bottom:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"></td>=
</tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;fon=
t-size:13px;color:#888;white-space:nowrap;width:90px"></td><td style=3D"pad=
ding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" va=
lign=3D"top"><div style=3D"text-indent:-1px"><a href=3D"https://tel.meet/nu=
g-ienp-dtk?pin=3D9387162795492&amp;hs=3D0" style=3D"color:#20c;white-space:=
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
chema.org/Person"><span itemprop=3D"name" class=3D"notranslate">llvm@lists.=
linux.dev</span><meta itemprop=3D"email" content=3D"llvm@lists.linux.dev"/>=
</span></div></div></div></td></tr><tr><td style=3D"padding-right:10px;font=
-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=
=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">&#x=
2022;</span></div></td><td style=3D"padding-right:10px;font-family:Arial,Sa=
ns-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><d=
iv style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemt=
ype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransla=
te">jemarch@gnu.org</span><meta itemprop=3D"email" content=3D"jemarch@gnu.o=
rg"/></span></div></div></div></td></tr></table></td></tr></table><div styl=
e=3D"float:right;font-weight:bold;font-size:13px"> <a href=3D"https://calen=
dar.google.com/calendar/event?action=3DVIEW&amp;eid=3DMGkwb2lkc2JtajdqdWllY=
W5namoxZDhmZDggbGx2bUBsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjbmRlc2F1bG5pZXJzQG=
dvb2dsZS5jb20zMDY0ZDI3ZTY4ZGU1Yjg2MTJlMmE2ODU4OWE3YTE4OTFjNzljMTUz&amp;ctz=
=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-=
space:nowrap" itemprop=3D"url">more details &raquo;</a><br></div><div style=
=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font-size:13px;color:#=
222;white-space:pre-wrap!important;white-space:-moz-pre-wrap!important;whit=
e-space:-pre-wrap!important;white-space:-o-pre-wrap!important;white-space:p=
re;word-wrap:break-word"><span><a href=3D"https://www.google.com/url?q=3Dht=
tps%3A%2F%2Flinuxplumbersconf.org%2Fevent%2F11%2Fsessions%2F107%2F%23202109=
24&amp;sa=3DD&amp;ust=3D1630364076563000&amp;usg=3DAOvVaw04055IfdwgcYuZt-Hc=
mj56" target=3D"_blank">https://linuxplumbersconf.org/event/11/sessions/107=
/#20210924</a><br><a href=3D"https://www.google.com/url?q=3Dhttps%3A%2F%2Fl=
inuxplumbersconf.org%2Fevent%2F11%2Ftimetable%2F%23all&amp;sa=3DD&amp;ust=
=3D1630364076563000&amp;usg=3DAOvVaw0W-T3liXC7dezGPgpvIehS" target=3D"_blan=
k">https://linuxplumbersconf.org/event/11/timetable/#all</a></span><meta it=
emprop=3D"description" content=3D"https://linuxplumbersconf.org/event/11/se=
ssions/107/#20210924
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
--0000000000006f243105ca6a228c
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
DTSTAMP:20210825T225436Z
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
 4OWE3YTE4OTFjNzljMTUz&ctz=America%2FLos_Angeles&hl=en&es=0.\n-::~:~::~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20210825T225435Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:Toolchains and Kernel MC
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000006f243105ca6a228c--
--0000000000006f243305ca6a228e
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjEwOTI0VDE0MDAwMFoNCkRURU5EOjIwMjEwOTI0
VDE4MDAwMFoNCkRUU1RBTVA6MjAyMTA4MjVUMjI1NDM2Wg0KT1JHQU5JWkVSO0NOPU5pY2sgRGVz
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
bWVyaWNhJTJGTG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MC5cbi06On46fjo6fjp+On46DQogfjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46On46fjo6LQ0KTEFTVC1NT0RJRklFRDoyMDIxMDgyNVQyMjU0MzVaDQpMT0NBVElPTjoNClNF
UVVFTkNFOjANClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6VG9vbGNoYWlucyBhbmQgS2VybmVs
IE1DDQpUUkFOU1A6T1BBUVVFDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--0000000000006f243305ca6a228e--
