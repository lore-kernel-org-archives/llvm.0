Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BE1BDCF
	for <llvm@lists.linux.dev>; Wed,  3 Jan 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vytUIVMv"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33674f60184so10651811f8f.1
        for <llvm@lists.linux.dev>; Wed, 03 Jan 2024 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704298825; x=1704903625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTmw2+iVdS8ogQZe3NCKn/UpJ3GhZUJEv6WLGyTPS8M=;
        b=vytUIVMvJe9hWjZMkusosIe6Qwv2W9GozixOoGyxmgkVeGmG5uufX09IOUemqmQplZ
         WdLGlc3u24e5FjxOCUpolodZ8JxD/uBoHPc2aG+83QtoLVkX/32Ab5ua7D5kufBZBind
         j8kgN32d9vNTu4v4161zFXXExk6wLleyUeJr7cCcbH+UoSYF3DoDddjjoh1tt3MhXM7L
         gOWUoLN7N3AzxE5a/y8OO3VkIaFA9RsWygMAYqfGg87lr/bqULNqXhR/kc4RzXOOywJb
         r8mxPAKlxvKkYNGRA37uwyAvIsNjlCyGBP4VuN8muH11B3M7nlF4CnpZpaoBBHavOywC
         U8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704298825; x=1704903625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTmw2+iVdS8ogQZe3NCKn/UpJ3GhZUJEv6WLGyTPS8M=;
        b=A1DVc1OEPL9UeIbD0kEY9SlUDm6Ab4azusfTMcqlSnZniJzxm7D0+YGXS9JEqNvDDv
         oBwGXa9jaXGc+qJjo/Q1+Et1PYt9PcOtTF0w8A/8fQhaPbAY22zd8zFApkMIt35lOI1d
         w77U4lDdrUDyiJ01ewJNHFhhUKtwxijSXM3wKFxDxfA+eZb3t3HwpQtvgIjbporpN9ck
         p67sABOy5Z7bhwlQxs3Xh1/iSUhuvrFQTRzFcrd7j6u5KOvS3May2VV8yAyZcXILrp/y
         ndYesRcEWE1noWSsxZlotSBoHER8cwZEgr1pyUGeI+L8BYBBSeppDvpzELIzz2kOa0pC
         Ochg==
X-Gm-Message-State: AOJu0YwXrq50oqci9MOEwzay/r4vP6xZZYrCReUrgYZ8uVvF/dpXo93A
	tloPmXpywgHPrcrDuOhs/BWwpEfQlor5ZYL7hzN1PZhuvKaB
X-Google-Smtp-Source: AGHT+IHfxuTaOBCg0jN9m2vHrKIYM9kBku6unbrT3PNPIC9Bme5F6ozo1UxVEQiGATU6TRybam7ND/gLdS4mIw7PJD8=
X-Received: by 2002:a5d:4ace:0:b0:336:8d41:5b03 with SMTP id
 y14-20020a5d4ace000000b003368d415b03mr8121259wrs.79.1704298824696; Wed, 03
 Jan 2024 08:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192107.wMIKiZWw-lkp@intel.com> <20231219205348.wvvxyicaatmljxm2@moria.home.lan>
 <CAKwvOdmrvwdbFrtzsOjoLJJZ1pDZOBWBiEb=Mx5bCHuKU2wPzQ@mail.gmail.com>
 <20231219210454.GA540439@dev-arch.thelio-3990X> <ZYKWxl9oQXODIoNe@yujie-X299>
 <20231227224338.GA267659@dev-arch.thelio-3990X> <ZY2EUr+EYzyro3NH@kernel.org>
 <20231228173404.GA412881@dev-arch.thelio-3990X> <ZZQ6CpBnqpBgxSgp@kernel.org> <20240102175342.GH26453@gnu.wildebeest.org>
In-Reply-To: <20240102175342.GH26453@gnu.wildebeest.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 3 Jan 2024 08:20:10 -0800
Message-ID: <CAKwvOd=AAuqKk4GXV0jWORwJKJ0gao2zVd_RYWXoA90A77c47A@mail.gmail.com>
Subject: Re: [bcachefs:header_cleanup 21/51] /bin/bash: line 1: 19420
 Segmentation fault LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux drivers/misc/eeprom/at24.ko
To: Nathan Chancellor <nathan@kernel.org>, Brian Cain <bcain@quicinc.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Yujie Liu <yujie.liu@intel.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-hexagon@vger.kernel.org, 
	dwarves@vger.kernel.org, Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 9:53=E2=80=AFAM Mark Wielaard <mark@klomp.org> wrote=
:
>
> This seems to need Qualcomm to upstream support for this processor
> type to bintuils and elfutils.

Probably should disable BTF for hexagon until then.
--=20
Thanks,
~Nick Desaulniers
