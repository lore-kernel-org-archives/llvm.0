Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920417;
	b=HEGIY3Af4PAzpAR2j+hQKw+w+WLyx9sH8fAaS3izc7oKH+s+/CmKRQ0MO4w9SO+2ME9O
	 TZsQhRWuoA+CUhNHhu0tGN+onngmdr/0q5GzlZjPLL/C5FQTo3dCBjrM2p/od8YELD8Cc
	 YhZ1IIXop6qdtEcMtEcOuLEvAA8tSAaYofq7TYLoj6GXRHqz9a/yMkYbF9dtvZsDws/aK
	 gRzso57ZnXcAe3svbndW9HKgVnji3m/4Svb3SNhDSVN9Sq/yEeBlgRek58PLdoec60Sha
	 zmTmQATQrmL71DHKoX5z01U8b6PwkWWUAk21MSSEPzhSMgHi90C8g4D15JgKQa9B40Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
	b=nxOzHvPYq9mBvJAkmyXFoF6LoGTb7pA0xKZMvGp1/ICWSf6+DRolYwJmTv8BRlY+W5iK
	 VqRDWrF5LlSPdnAfj+wLdS0rzYR64/uo8sl9tFSBCBNREFDylQd7MSvQ6zmwacRaB9SWu
	 2Bmo22LQIWHDMNusjzExPrNf5iFuHGaJ8DURFByK3ZhX6ScIWLr2QGae+zUp6A/WuyMiU
	 9roMFr8KgQ0vDlQSDKLnGGKYX1VaoMg+4kh0hUaIRyitdoJfFS/o4gOstxy9RDr5qZMtV
	 K5pPc/DjJMVrX9hmHzE8tzo4Jni63IpFGXCg3JDud6uXiScHVBK3tP2blGw6KX48g3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpWy+fIg;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DD606A887
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73DD606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpWy+fIg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49412eb1474so2429291f8f.3
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920415; x=1795525215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=UpWy+fIgy6al9ZdOiJLpXg/XUsOPw4JYAVtxnu7oaKRq+V59A4/vSTgTmEV3FLdG+z
         7DsPWqe6RoyZGhOCxmK1U+jigEGNb5mU1p9fu9Pn7Q4ZKyeQPGJ3nooxu0DMa9frmRhu
         XVtD/4nepKMoVPpC9ZgWEihKIOEkj+WAaTduzord4XReoBHgVv6auLuB29aq7PwWCY8n
         ALTBjrHRU1BzfAHB+Cyu/5Abe+RcbFragc7QJiTxrtpH83OSI3Szj6yAtjrr929UBxF4
         N8N63johsRPH54hx7tCi52sWiMEzaAmNLJJm52SQQ1qeaBXC2lIzLsOtvBB+RZAr7xpF
         kDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920415; x=1795525215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=bTT0qW1zWUDjh+XMNIFF7XdmJsB1yToMUxDA+wfoi2IH1No1t7hrN2AX64/qZgdjzW
         45l+C+tdwbSq+0EkaTNV9DFiNYxkVXvUcM4wkuWmXbiqf3PPqDU5SsrqW9oCGs1Q3wX6
         BL9+uv3VE3Tfk+MIu+virsdJB6ZUcUyaWjkImtRTzwClvsI8ZiIblm+Od8QOfwPSeq4Z
         abEvtEjPotUVRRdaibae6tOCIPuBafu7tYu188JUzJsKAi37dkyYe1xeK2RLxumTbwIQ
         APGVSVmtw/TtKWIf/oJSeROPUWGKR5iWr6UPTbW9cAySIpKhXacuNCZmVHG6+Qfu+Kjc
         NDqw==
X-Forwarded-Encrypted: i=1; AL+hErET/2WdagNpdn7lswEawhFk4oudyIAhoAkizLYsDCS++MTcWYwOv14ByhGWD/fnzYuKl5JO@lists.linux.dev
X-Gm-Message-State: APuU4Z9o21u4Vp9F8IGUJKsSb1J+jpOsyYu2MuweKjeAZSIxALyqRP24
	Pr/R3nydqrsVx1HQSmQW2QccP8WEIi8955fobyNEXVi16CweerFKvo6Y
X-Gm-Gg: AZFdTZfeKr87aPyWT7s3NkLRliMfL+dA91gih2greEEc4f/hA3/5AH3eewaUtyS8Rfd
	HFn34gjzgAYMr9m70hwwPVZ9/Vyhc1OtepDI5zZduYvoV9w/+NGCCx3eLBZDfvrqSjN+v1eJbeK
	iOvWAanL10bM2PlXpzmaQEemzeIW0Mqov8XE5a2SD/Ar5yIpLEB2obgwZEMJ/RAIFdpnPbX55k4
	N06Pg+0jtl12OP3LipPcuMs8b4FxMZWnXHbEoMm04aetqEO4lq0agMogJU2Jj2R5g8z0aoJTPi4
	Js8NsHnLbxP5S4WAQK1P5Ii9IfDSBVTJd/hEEUn78UVBB1wsP/c2PbZuN5EwZS0+YqPJa29xKrh
	aaW2CnsaNfpXh+pdu2gP3UkYHnHw6uWAWKAWm9ohmEZXTah78BKVS3FRnkYDUsrb8Xnf6/CCLbD
	HOP8RNKVQyjoU969B7913JUKU69RgTVptFlem6ShFQygZmjEsHLtvNG+Up0UEhhUzKeYvi/SPOs
	H2v0f/Bg195lIo5mLb5M6NY6QqWT5HEQrhxgd3YhsxEPIfKTnuM59rkQcaN0Sdm2pdm4YwVo4cr
	AC4SB5OdUhkA2ihH2KD9HH4ex3pzzq7Uh7H5tRr2uNYZQnBUeDnKDqdiUV/JDTlN95va0YXvaDn
	O6M+K7yPBvv8=
X-Received: by 2002:a05:6000:46d0:b0:498:2754:6a80 with SMTP id ffacd0b85a97d-49c725e538bmr20536616f8f.28.1794920414596;
        Tue, 17 Nov 2026 05:00:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm28207005f8f.28.2026.11.17.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:13 -0800 (PST)
Date: Tue, 17 Nov 2026 13:00:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261117130011.05eee0a9@pumpkin>
In-Reply-To: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
	<20261115142431.1587690a@pumpkin>
	<CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 19:15:11 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Fri, 13 Nov 2026 14:12:45 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> > =20
> > > /proc/kallsyms is the primary interface for userspace to query the ke=
rnel
> > > symbol table. However, resolving even a handful of symbols or address=
es
> > > requires reading and parsing the entire text file, which is often sev=
eral
> > > megabytes and takes thousands of read() syscalls. =20
> >
> > Separate from this, I've wondered about separating out the /proc/kallsy=
ms
> > code from the code that actually handles the symbol table itself.
> > The two parts are pretty much separate.
> > IIRC it uses a static function to get the symbol type (which does most
> > of the work of getting the name - which it also wants) so it isn't
> > completely trivial.
> >
> > I'm pretty sure all (well almost all) the changes will be lower down
> > the file than my changes and won't cause (hard) conflicts.
> >
> > I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> > in userspace for testing both, but had to cut the bottom off kallsyms.c
> > to get it to compile with a sane number of definitions.
> >
> > David =20
>=20
> You mean separating the core symbol code (top of file) from the procfs
> interface (bottom of file) into two separate files, right? If so,
> seems reasonable to me, especially since the file is approaching 1000
> lines even before our changes.
>=20
> And agree, even with both our patches, most functions can remain
> static in their new homes.

I just tried it (on 7.4-rc1).
Only had to make kallsymbols_get_symbol_type(), kallsymbols_expand_symbol()
and get_symbol_offset() non-static (added to kallsyms_internal.h) and
split the file before the definition of kallysms_iter.
Then tidied up a few #includes.

I've found a much bigger problem though.
All the sprint_symbol() functions do unchecked writes into the caller
supplied buffer (no length is passed).
While the buffer is (usually) long enough for the name, there isn't
guaranteed to be enough space for the "+0xoffset [modulename buildid]"
that might easily be another 60 characters.

Some of the people who have modified that code recently really ought
to have fixed it.

David

