Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B304D8D96
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043619; cv=pass; b=tAMUN2+AuQB8m6xQvd2uO61WOr3MGg6QWmWzcH/GiRAtpWIk/n2o7BuRlwZKi1qqdUk+jzwhxkfmvEVq6oTZ7ZbM6SzfB4F8s7YxnKTUGSwPtyqoSua1gYXCGb1QljuDAIdVNsgrDlKeA6cO8iLu30fB9XIWNhW1AO2A7KZ9AGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043619; c=relaxed/simple;
	bh=hSgi0DQrQeGWXJn/UStoGjVMSyxqvgC7nF5MpkTHiIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftrXXBBoAD/5Im1s4uotT/GeLV07mVQpjCo9q2YlJ/QxZXRvWwjwar+8ybK2Jl5wDU1HJICp8vt13PdgD4vM9OoMiu8nwVcwOWBgS7vsdsy+lwFd7daUaa4ECVIx+ogGWLAr3YkkysSbs7BOLQ1fOeRTG9lKFRERIUtJB4g8cnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he/v3tpZ; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he/v3tpZ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-91578122305so968469385a.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781043616; cv=none;
        d=google.com; s=arc-20240605;
        b=bmFjE3MIGiC+nnPayBaFLGvT7QTPSXLKyiAfZK0Y+et86V6AVPHkcTIOsvAdaeqU2L
         c/JD7B7F7xy/kbT5v+QRCoFHBVrl1t9oAot10kySdwI8dKeWhRvIyW/LxJ7J3e8vAjWb
         v6N5Efzgup2Hm5WrN0z8y4HS9dHu+CDiW9gPIWiWhL1SA2aLQHsrI8PnwTsCFCwtZxH2
         mhpFWzb3fLXeP5zzlAPvrT8d6DN3pML2Ct20kRpE6y4CD5dzOXZrPRLblwdQUel1cz00
         3jYHMvnDn1PF9j4pFtv5ndQvmNI/tQdOHJuXjuJ+1UvffodxafK6ZOSP/BeyYZFlG4UA
         uobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ot/4t41HpYuXj39wqSGjI97S9W+8dZZVBBjzX6WdKw=;
        fh=r1iIYsw1N8+YyoRvQJxYcjmqn1VwojGTiD+Sfaa4ZnA=;
        b=MpnyiJCKyh6QPTHefLuX4xj5t7tmfA5bd2qdhXejJVUZWWlvVELXLqkk4xWeFohXlJ
         Ux4JY0SfZ3YRsSMeeFT3pLnoPCaspRCNHisuDYyitXSldUjArC/qk81Ir4XCarWPtzcz
         xnzM9yL/W/8bQrdmGETN6eYR5M+rSGCYt2ryvUI7a+e7esgjmrYynRq9ipcd+HcMfGXY
         tfJmp+mO2QpYH8Ne9U9KmVdchu65lLCGAf2l7SzgI/jjQl8MxtK/F2DNbd4TqZDWZA0Q
         B9CaIftvrKnGX1oyIj5ecFJT6fXPJvz5I48IV4PrOobGSPic7CXHFZYNsN8rptks/v7b
         N3rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043616; x=1781648416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ot/4t41HpYuXj39wqSGjI97S9W+8dZZVBBjzX6WdKw=;
        b=he/v3tpZKdW7RfyrdoUQzAfbqIAo/HUqLQDc7goVYbVCZWX9Xh+IUeWcmV9/tyoz32
         LusgJPAekcebZ0DtyvXmP+Xh8EYBv07tmGWPnZ+WyGXmx+mqg7oUPgpuZcrEWMaBvCOn
         OLGDLzvmpIfzXe2UoE0tiCJnqzWRXvLrtveyFfkl/lgWfpNcy4V+4/Z11Y29cdubfiN0
         uVO0xblCQUDgcKUtUzEmegNrdSAI32086qBdrM4fV7j+mk4GXVhiUQP8uxncpe4QzjIt
         ds/xpsSKEiVpjnSaDX0wCWZGWJDt4ygDkI0LBtPfj2c+a7erZ+/vaSkhoWSpsihRscDN
         0Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043616; x=1781648416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ot/4t41HpYuXj39wqSGjI97S9W+8dZZVBBjzX6WdKw=;
        b=atHTTEBDri0b4asJ85iBnle48kwpDMeTMYOCwqNCH2OMAb1FqHp/49YFp/kXoijMtw
         eP7VmmR5EN7dFlBCUUBAEbS17rhtuExXdKQVr0wZ2tz09Qrbu+zrUeqYbjh+Lo0G3y75
         YxKhx8ezqYneZv/5r6oH2ziLDktSWQZpHgo9TMRaBUglBW2KWxkBtCPbxZe9OjKbuCVj
         VuWa70Ifui37vSWOXRevQMhdLQj4i70wZPkyY5eQBLeWDq7QeVgor0cmvld1q+6yx41/
         EQfyrvztymEPF4YV6rKGEBPAcdX7BBgJZXF0zNiygDTVZ11XAf4ZpJT2fiD51cDlhkKb
         G2Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9eMwAHknUt/6XiOe52QLWIvncFqYTyrXW/xTbKTJUDV1DXCLBgcPpHAEQwebwHCGHa9GaF@lists.linux.dev
X-Gm-Message-State: AOJu0YxORoBi9MNqGdgTvFYvRUkODMAj1gdKA4FhRkHDfj50nif+PbPS
	e5Bi3l9VgbLDqUVm6F9XIjE6oTSP/ahtbxXr975IuHFrl5Dgw0R/sgeYIM+8DPSaN8MbW5YfRgB
	sVFUH7gcm5Ry0C4yxNksf0pwibRgnFPs=
X-Gm-Gg: Acq92OGiQrKHiqEYWHPN2HN8CyxBZwWvYZ4AzgN7+LP4VM7WM8qfa4s8d0EfmDRk31C
	9OVJ1UFU1j+bxJvFyHGPGU8FuovuV0CMac48fz8x/qleghAWy2AgZrWvPe0PnupmMqJwr3ulO84
	52KRu1RkmOUIxYBllFfKlmolEl68sKLDOBqMRyAjjMgQYWKU4KqsMjTDf4pnVDpkQN518Ag7S9G
	Zt+OUFV+5RWp/RzoZ38Og/rHAfB+LBS/PNlhH+6cxs9f+LlW/fqspdxbNDcw9VRvnwkQqSjgZCM
	KL35aN9SPdDVRm+LOn/9z8eg4E86mrTOPIktWOjaElomoB7dHvDJUiOwRVDfSTIy8MVoXo42elE
	JStd6JDRIVVHmwHNAEZkZYLfc4r6I1p3+YcDeg1B/iEvq2q3Go4tRTUqjL8I0WVbiZEevoQaGsf
	vF0aQBjXWQgMe2BPRXdv4ae3FqqovPL1ZT
X-Received: by 2002:a05:620a:1d0e:b0:911:9a7a:8076 with SMTP id
 af79cd13be357-915a9c350edmr3718229185a.8.1781043615973; Tue, 09 Jun 2026
 15:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606091825.Fvo4zzYp-lkp@intel.com> <20260609141108.90414-1-cel@kernel.org>
In-Reply-To: <20260609141108.90414-1-cel@kernel.org>
From: Steve French <smfrench@gmail.com>
Date: Tue, 9 Jun 2026 17:20:04 -0500
X-Gm-Features: AVVi8CeOfYnDex28-rn-0FojbcnrExEKLSF5jGwKXya_gdEo9vDq-mOmY0-SzJg
Message-ID: <CAH2r5mvCKnRjvt4VK7xj47L4yLoBc8_dTc_CRHjG4xq2MuFBjA@mail.gmail.com>
Subject: Re: [cifs:for-next-next 15/16] fs/smb/client/cifsfs.c:1204:22: error:
 use of undeclared identifier 'FS_XFLAG_CASEFOLD'
To: Chuck Lever <cel@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Steve French <stfrench@microsoft.com>, Roland Mainz <roland.mainz@nrubsig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 9:19=E2=80=AFAM Chuck Lever <cel@kernel.org> wrote:
>
> On 6/9/26 6:24 AM, kernel test robot wrote:
> > >> fs/smb/client/cifsfs.c:1204:22: error: use of undeclared identifier =
'FS_XFLAG_CASEFOLD'
>
> FS_XFLAG_CASEFOLD and FS_XFLAG_CASENONPRESERVING are defined by
> "fs: Add case sensitivity flags to file_kattr", the foundational
> patch of the case-sensitivity series. That patch adds the two
> macros to include/uapi/linux/fs.h and folds them into
> FS_XFLAG_RDONLY_MASK in include/linux/fileattr.h.
>
> The cifs consumer ("cifs: Implement fileattr_get for case
> sensitivity") landed in for-next-next without that prerequisite,
> so the identifiers are undeclared. The failure reproduces under
> both clang and gcc because the macros are simply absent, not
> because of any arch- or compiler-specific construct.
>
> Steve, the cifs patch should not be applied ahead of its
> dependency. Either base for-next-next on the branch carrying
> "fs: Add case sensitivity flags to file_kattr", or drop the cifs
> patch until that patch lands. The full series is intended to be
> merged together for this reason.

Removed now - the purpose of this branch ("for-next-next") was not to
forget patches in next merge window,
(ie that are too early to merge into cifs-2.6.git for-next) I didn't
realize that anyone auto-built from for-next-next,
I didn't want to forget about the followon patch to yours:

smb: client: revalidate attrs before reporting FS_COMPR_FL

  cifs_fileattr_get() reports FS_COMPR_FL from inode->cifsAttrs.
  Revalidate the dentry attributes before consulting cifsAttrs
  so that the reported compression flag reflects current server
  state when attribute revalidation is required.

  Signed-off-by: tanze <tanze@kylinos.cn>



--=20
Thanks,

Steve
