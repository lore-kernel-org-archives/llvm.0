Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456CF371065
	for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792382457; cv=none; b=MixYCPIC3UxOI3WBhD6sFr6J5qIk9Mt9rwZ/gS3PiWWCAIdTxUPAVSlK54Zw48/Wo24j17ejA4djQlinUee3uvJQOtBkp+/93S4g26bluWqLouPkjUy9hIuw2+EJ+ovRjUJlWf5/F2TSiGLUb96Y4lJUIHyfNCAiUunp3N0MOro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792382457; c=relaxed/simple;
	bh=czjGtQCylPKGOxgwRT4H3LIqs4PEQr/yg9uE5mWxNEA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=A7AO1Va0ZQyHolvHFsRt/19500UaQLIv/1hxAN7w64yF1jc3ztWzBaHRDj1O5fR/E5VLYgM1qp/jOOLievbdQzcXMdAR+tt32oQrQM8NN17S7U8CFBWtkWNxWNY00CNaBtI10+lcgAAM8UWTkgW3AT59Op6snyQ1N+7JaCIBWIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ofy7rMpe; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofy7rMpe"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1387330a91.0
        for <llvm@lists.linux.dev>; Sun, 18 Oct 2026 21:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792382455; x=1792987255; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HFoWvp0cIKmjLdrdC+FIWOJcYRrNmj2fb+vTIhO0WMk=;
        b=Ofy7rMpeLqYr1ogVzJaCslGIRnmMsrYPZfHFPkTD1YRlVk9D0XlSWErmqinP47ewlv
         OOwMYWGAYvKU3Frlmxa3n9cb3aZDO14HOlrpOU6H9KZOLurV1F2KiH39H6DSTXkBgTdp
         9hUAlQy2BpOJ02E7lcWBow3GfTioA770OdbM/RnG8GyCTaYKOb/uM0qTbZHjmQUACArd
         MBd5xwjJYg+DrSiC8nrhRqfbpcXrGVkni9a+JvHmJ3TH8xCFGtzIIk4G8BPGSmg0vxR9
         6zOkgoK4vuNvYFozf7RPCtV1Iyroaa7SEaogn7cseoB/C3DBk1/9ilS6VKlPbQmunF4a
         DpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792382455; x=1792987255;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFoWvp0cIKmjLdrdC+FIWOJcYRrNmj2fb+vTIhO0WMk=;
        b=hm5lbmFB72JKzfHBlYDsDClfY3caUrsy66BFcwB6A1Chp5Sn29P9bfY/2RL02/yN6L
         kIkiKIcOy6sehU7vUokUTPv4PSX6FnKu/Zpq4fZnk18q4u7Prl554V6LLFl0F+jgOvqs
         zqNuBPu1lV2D+x8FdD3U881pPpyrgBOf0ZoEvG6LlU3/JGO3RXLX7O0oYsYO9WpvaDtt
         qteovwgp0tX1bLPCGltiNijp4U082K7sJBr60LUECk/0Ez6vOmiuPxclAvjbvlewYFYU
         CglxkfBPncexfDVoyObOte++wya8M4VeIdxj7DTmdxF+CAo5DcgUyU3ERlKNt38wio7B
         IlXQ==
X-Forwarded-Encrypted: i=1; AKwUvByuw0/6h/k/iFJJ84QTiABLleSqPBPSdgBneHDenZlkeJhP3jhlDL5p1W+cjNv5fJqBtyF2@lists.linux.dev
X-Gm-Message-State: AFq9FYIC10+5KeL2GOrryZI/9zEetxwRUXy6c1VoBfmrwUU3N4QD84j5
	VYni6zMp96ERwFy9RkSyZuFH1fJU3QPKyc+tQxI1drNWud/Cv6wNfZ6T
X-Gm-Gg: AYBFou0l+jUsFVk2PdgXgmLfABJEoAAq1oeuYHZ4dqmpz5pIPQiT71BGCk7zGcF68LB
	UyYKI7orfbC4PfDVfsAfXDbMGKMrbAj7vHsTGlVXAEBhH9SBosvUacmbx2vRgd3d3jvjMEF9pUk
	brtD9lGhhWBAL6lhNgH5awdakOVL233LCBS2jrq8Y5vTPPyJq8xYFFDkgR5d3Ab42p/x5MByw0d
	wErfs+s5LpVGFLZNoJQCmivlfAzHL2OviFKjQHwKEV9ugQOpt6SQddYvdFdCAxjfO1E7GxlDYBo
	/GHBA9RM7T9cbUBYsWIa1ANjaF8d3ZD/WcoXXDCuj+LPpYm7TXe2rj+YCy9K43NmwLKIB8gREml
	d00VvSXuS3+wedf+C0BAvcvKRbfRX0qcmT12zhuZ35zsxCA2+sjEoIGo6NIWLa7+URmO/oif4zY
	rjeqoNiAnQ6UyPMdC6eUqd91Xv86Fz9oF/zOl0L4Kg78kFFWOMrYLUqERfqkTRpl+aEdHMPvaD8
	SQKaguaeTlE1nFU
X-Received: by 2002:a17:90b:570d:b0:3ac:397c:574b with SMTP id 98e67ed59e1d1-3acef3cc8bamr6000770a91.54.1792382455469;
        Sun, 18 Oct 2026 21:00:55 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0939725sm7800291a91.3.2026.10.18.21.00.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Oct 2026 21:00:54 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [tip:sched/core 35/37] ld.lld: error: relocation refers to a
 symbol in a discarded section: __UNIQUE_ID_addressable_overflowuid_553
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <202610170544.6hPndDUW-lkp@intel.com>
Date: Mon, 19 Oct 2026 12:00:29 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <629C00D8-BEF2-4B35-A056-2D8699F355FD@gmail.com>
References: <202610170544.6hPndDUW-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)


> On Oct 18, 2026, at 3:46=E2=80=AFPM, kernel test robot <lkp@intel.com> =
wrote:
>=20
> <Mail Attachment>

Hi,

I reproduced discarded-section relocation errors on tip's sched/core
branch using the reported configuration, adjusted by olddefconfig:

- fcceb7da9465 ("sched/cache: Avoid publishing partial LLC utilization")
- Its parent, 96a494c9cfd8 ("sched/cputime: Don't account idle time =
twice after dyntick-idle")
- The earlier ancestor 840e23085b03 ("Merge branch 'tip/sched/urgent'")

ALl were tested with Clang/LLD with 23.1.3. It fails similarly.
All tests used separate build directories on macOS, with a host-only
gen_init_cpio compatibility workaround and no kernel source changes.

The generated ELF32 `vmlinux.o` files contain:

  fcceb7da9465: 21,371,209 symbols
  96a494c9cfd8: 21,370,053 symbols
  840e23085b03: 21,370,091 symbols

These exceed the 24-bit symbol-index range of ELF32 relocations. In the
840e23085b03 build, I inspected the relocation for the basic_stm_init
initcall:

  Encoded symbol index:       1,427,711 -> unrelated .L0 label
  Encoded index plus 2^24:    18,204,927 -> basic_stm_init

This demonstrates symbol-index wrap in the local build, explains
the references to unrelated symbols and suggests a toolchain issue=20
requiring a fix in ELF32 relocation handling.=20
The local failure occurs without my scheduler patch.


Thanks,
Jemmy=
