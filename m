Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B882BD1B
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 01:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803973; cv=none; b=e1EWEQhyTJwuXWhORdphLVtVvMI+Zdjnx/lHK2hmH8KQeOYkvn88LoP+syKiFNYPw0ujt602vpNBxIBiW5LpewtastwJhPsHQKba3cQy7TMoA/suRMkezy/hR1zie7I547+Z0fTb10AWnQaZ3ufzSypG/cb0TjmD3ehUKWiyg2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803973; c=relaxed/simple;
	bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uYY93XVYN+w0utVmgCvpKCMBbyYl9nQ3TINRenlpHQJvDnEcObCPeVSdbS8blCd+qljzUhmeorG0xYRkhAhoB8PIVtjoQ03a/cjzp+PC8N4GYZgsZdCtGVfP34yIkabwOaReQNefkItgj5IWPjCZxysPREXa/c0VLYZd58YNE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=nRoxZYr/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="nRoxZYr/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so136400f8f.2
        for <llvm@lists.linux.dev>; Wed, 05 Feb 2025 17:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738803970; x=1739408770; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=nRoxZYr/ayt8je+69E1BgkcFimm2H0wVZFbdr3Gz1sHl/q6wF+wsCKJvo6cDi/eauI
         8Tsf5AgN3M3tfQAwzuPJCKc+UEmiNW8aRYXbDhviAEJyYesvK/20Pv+vLMIn3D5gDbUH
         dg4AmqUou1feARMDM8E6khvckyJMx7zayKXuX/Pza1LPLwdtc91bwrLNQ7ALmtAF1wWf
         24LH630EU3cTbF6cXsV5bHq4txuycozzNxsOqFwJ6ogKKLCp1xB3MCU0i5Q2lhF0oNYw
         ZVibYh36C2v5m+MCrv0oMxlTod3Cmou1IKcahR+17yYkZNz13rwP45D/0Fly25SnRynQ
         K6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738803970; x=1739408770;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=iHUj1fotZ/4KYDhzhBKbGZHqh0c1Qi3oqrZtz6hymGwSeFNq8atYHrBWjUf9khn6bm
         cDezMIT/qzd6hd12dmlPMFNFwmdBXy3wx600aRVS2K6eaDrXBG7VhqGr+FpPVbj2PHf5
         2BT96KLSLuKtjr8+SB1Wxy39VF3V+NarHwCc5ARjTpbYQWoaDMkRCabfjDdJgUmpaXZz
         gofI9QLLqhSGPc45txEus64dugg+7az+LeQjD4AGbXN38vsYeO7LylWGzvzFTqETTzEF
         W0IC++vpwGQn3OSZfSEEvNhwF27aTewXg1dJGK4LFe6llOTf/WaaFnItYux+z2Y8p2Wm
         ty7A==
X-Forwarded-Encrypted: i=1; AJvYcCXhW7/HuLZIFN5sVVpmjbVcSW4jHt9EgnFRbLbr+JymXaZlavOkbmCTriORYJkvnCji2bdG@lists.linux.dev
X-Gm-Message-State: AOJu0YyB9fVdpUbPaeQue79JdqNLOOZYse2NGXIGV5ICWhKGQYAHqxC4
	Vel5f5Bs8ENC4oH17scFyImNkMeZO5YqjQLc25V3p08KlKQNbt5bzcdnuhIVHwk=
X-Gm-Gg: ASbGncvufqMVl0Ei5toTMOtRmxU0nOu76H/jMYn63NKy7GAKPpRX3gPQbbJtH5+Curf
	9eS/j/QGLMAhZOzhjeHyDrbqwNP/j02OUfwdPsbHCEHzvUwhvx6nmK1WrM3CMF/B73VqqZJgFST
	jc4Bw/AAKSI2SgRRP0H7XzXDs/ZK+4ibEEu0w3VzNMead2lF7PKl32LMbEMuvr/0iEutnG6VjNS
	IydROCpZ0oL625zDNVjpyKDDQv93lAK88um2Z/h0E3ikmJFqi05R1Drt5Juk3vih2Y5ZUPvMwV6
	l+3+xTZNWYcKSkcmXUdlJn/1PJWp
X-Google-Smtp-Source: AGHT+IEwac37+EXHhjn9+QPVtQMUBZtDhAuPXBew4a2Q2YL1bLmJ4OaTvYU/Tl6sFbBaC4yuKH/eUg==
X-Received: by 2002:a05:6000:1f87:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38db4873819mr4226170f8f.16.1738803969824;
        Wed, 05 Feb 2025 17:06:09 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dcc7sm246954f8f.88.2025.02.05.17.06.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2025 17:06:08 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
Date: Thu, 6 Feb 2025 01:05:56 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
 <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
 <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 5 Feb 2025, at 18:51, Christoph Lameter (Ampere) <cl@gentwo.org> =
wrote:
>=20
> On Tue, 4 Feb 2025, Jessica Clarke wrote:
>=20
>> It=E2=80=99s not =E2=80=9Cno performance penalty=E2=80=9D, there is a =
cost to tracking the MTE
>> tags for checking. In asynchronous (or asymmetric) mode that=E2=80=99s =
not too
>=20
>=20
> On Ampere Processor hardware there is no penalty since the logic is =
build
> into the usual read/write paths. This is by design. There may be on =
other
> platforms that cannot do this.

You helpfully cut out all the explanation of where the performance
penalty comes from. But if it=E2=80=99s as you say I can only assume =
your
design chooses to stall all stores until they have actually written, in
which case you have a performance cost compared with hardware that
omitted MTE or optimises for non-synchronous MTE. The literature on MTE
agrees that it is not no penalty (but can be low penalty). I don=E2=80=99t=

really want to have some big debate here about the ins and outs of MTE,
it=E2=80=99s not the place for it, but I will stand up and point out =
that
claiming MTE to be =E2=80=9Cno performance penalty=E2=80=9D is =
misrepresentative of the
truth

Jess

