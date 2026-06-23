Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A83ACEE3
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782248280; cv=pass; b=I4rv2rdgnmXAM/X+jZipGRuHjnTvRi6kcjSTrbimW3omGI3iGvqKhjm7ZNOOwjcmTV13xf3wfGGJOsm/vHy58LuRb11mr5NfVeKdlNdC2pKrv21FOvOhUHASZgMK5sioNGzctMbPa2ZS9tJF+qYVoSti2wNQUsG/vTf3CZB4Tno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782248280; c=relaxed/simple;
	bh=tZD4wAYb+y2VgKBqrTFjkRfOfQqkIF6Af5V4/AWTsUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8Os1ke2DLLvXM1IrGbQY3tJP8+NXijHGoDj+7dW3dJXijVQIA0Fu5RBBBe91dzkVNcTX0f9Rz9PG2i1ss7SSBxpQJ45SGr8LrPUdgHX8J2E3QvKFdOpdlLc4R7OrTbwnyLE4W6PhGfPx0UokuKNG+u48oJTR1rcs6oSb3pDY5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIbFYGB1; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIbFYGB1"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-440ebc72386so248112fac.3
        for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 13:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782248278; cv=none;
        d=google.com; s=arc-20240605;
        b=cgEIJmUhQQMez6Yz8Dy75/sSzAo658RBQgQykjPhWzJaLhrSZTORj0qrjkmtGKrtbC
         M9qZe59EiN3aQpukHQZAs8IXXeOwdrB5suKYNyFZMg42W6OsLT8e2p+O4/XhEUyXTaOq
         8EAzLfvlQe4ncsrc+wGCgPZLZ0gRdJ/lysJV1J5GsJ3l3tnyZWFeGSrcbCSOW/pIAeBe
         bVuW96Pt3Wj38cX7GDchDT2tHSm6T3BgKTuxhT21Ytqf8G8HJaDdFDTMzYx7qXVD2MjE
         B6aJ7563nCMrFSwOYtyGoGg8BU8gIZpDILkF0aep0txAhOJUpzE+3Rhhg9QOBtKLbkog
         byzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a2M7vBDaf5sfghfzO4aFniJ6HurxB/f3swPv996qsLY=;
        fh=eKzhstKUcxAub00rF/706deqEZB4p7weNOJBmIjYyZI=;
        b=W/1YHWWuqhivBA4K406bM9ywzRcRNBL3ty5Ae4tzYfLmmgmiA3AWwvS08Px5HHIP8o
         5OdiQwmelQEoa9uTM1fv/j+TtvodqiDKfaCc0fn3T64txSa7SsSttZIhtC8kQIlI4FJL
         P9pGnRq4NDAtCWucEYjHpSrrBby2eIqYonz6q3P4NtXYO7Q1BC10qa08KWryy8+9XN3C
         wEulPQKWH35tccCd6G/DOrBVNqaUD8TIWzvomkcPhkU/UmhdDgwGFFfeVIYzsyYNuanu
         nDcq80LqqFpqgm5XimZ791qaoUv6oyiV4/qceu3KAbeB5XxD/jsd0y47erxB/fN0Jyzy
         KAhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782248278; x=1782853078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2M7vBDaf5sfghfzO4aFniJ6HurxB/f3swPv996qsLY=;
        b=HIbFYGB1BGdrvs6kSMmal1wzPiVxlKj55N2VO/wnWTnc4ybRN31JnSaSGEiBE5HDIc
         bShdw+60a8KQk5UCuX7smLX4SKJIwHelYcueKwaeAlbgbMqSbiY4bgbepvv1ZDK+fsys
         HpdBYXEIkiFv3DZ6Vt9PiVMWwPFFUHuT3qY7F0lsDOAAqVZSCmJZ4zxu/4sCCJ5Z5ihZ
         kTStsO+SyALjRjaEuA8R2/iEyHJFeTCL3pCRxuJwtZPmFQ2H58yjy3POTMN8htlopnCM
         5gR71xRWqA/CzaOgF8yYs8PFvs8W6L+0GcD4VB/5bmXJPb+0HSpUmW8+HApwm2lQQPaa
         RwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782248278; x=1782853078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2M7vBDaf5sfghfzO4aFniJ6HurxB/f3swPv996qsLY=;
        b=X95vFzZ2v5AEMaLWwxeKv3GWbQf3Oc1pcttbm2Pxo+xIyG5TRJIV8uxmFXuZYbKUsH
         t5Yy+85IL5n9/odGbCIGxOdZETrZUJJNX9xQEvImrRvzKytxxm73ppKhA46HSFtWcv3l
         tpBlcawO4tjxr+yG/qbHTwypElfqz+WoBJ1KvcpTbaZjEumxbhKGz27roQwioBPlibUs
         ujFL3Iz5/2RN6enfjpxsqZutd8u7Rm2dHu0UXBXTAdS/SNUNk0BoLyI8jyVTlyX2BF7O
         +IAMR0r4J7ktyBEWiJq6V4bp6J3YOp8QZYGtOsAs047xZO7Eb5CYJX9BO7ftJlVO9dsX
         wi0Q==
X-Gm-Message-State: AOJu0YxRq/0Qpt3XTCAlORmdjw5ilh61R2mX6VE2WCJ6HJvYDr/44Qai
	wO4MSVDBnOxrUjLPyt7cSBQSCfeYRY21LpKsVWMYyhIhTByOGLFVexPhSHEXsCgjXlNwJjCVVbE
	kiV5JUkk5J3VZAYxx0gkBP3x2STS/mLs=
X-Gm-Gg: AfdE7clqY+1GhVrAu05AAoYNMg7Py0B+m2pcu/POvcXZzDXuOyBaXKDzCKd0WIpUPou
	dPhI1yFeCNPp+nHFUulSp037q5gU0wDxsb1tCUwPqW+ujMaYs2UzY5ZnPIiNTCwle/eYP+Q+q1f
	gZ0umYCksssDEZBiN0MQ7esp+jjelk81R6xgZoyGPvsGm13mvAKG1GGTb/A68mHM2BH5IMZ3Zh4
	3qBBG+v0kjcXDLyYRnP6C36v+CM+48ggOUH932REObMIEK8HHACBtFik73T2VWAyZ7dHsMX0Wbh
	wnpV9iOt9A==
X-Received: by 2002:a05:6808:11c1:b0:479:d57b:838a with SMTP id
 5614622812f47-4907af79d23mr317126b6e.35.1782248278205; Tue, 23 Jun 2026
 13:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606232356.gwHMAJAW-lkp@intel.com>
In-Reply-To: <202606232356.gwHMAJAW-lkp@intel.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 24 Jun 2026 01:57:46 +0500
X-Gm-Features: AVVi8CcaF4NXqwNvxE7N2NgAgzx5JbuuzYQZNIz7vg_1-Q61neT5jUs5nGPH3ho
Message-ID: <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
To: kernel test robot <lkp@intel.com>, jpoimboe@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[+Josh, +Peter: objtool question below]

On Tue, Jun 23, 2026 at 8:17=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> >> vmlinux.o: error: objtool: amdgpu_vm_handle_fault+0x186: sibling call =
from callable instruction with modified stack frame

I looked into this. It is an objtool false positive on a computed goto,
not a problem in the patch, and not specific to clang 22.1.3.

Config has CONFIG_LTO_CLANG_THIN=3Dy, CONFIG_FRAME_POINTER=3Dy, KASAN and
OBJTOOL_WERROR=3Dy. objtool runs at the vmlinux.o link stage (per-TU
objects are LLVM bitcode under LTO, so the single amdgpu_vm.o never
reaches objtool). The robot hit this with clang 22.1.3; I reproduced it
on the same config with my system clang 22.1.8 (CONFIG_CLANG_VERSION=3D
220108), so it is not a 22.1.3-only codegen issue.

What +0x186 actually is (disasm of vmlinux.o, WERROR dropped so the
object survives):

  17f: 48 c7 c0 00 00 00 00   mov    $0x0,%rax
          R_X86_64_32S  .text.amdgpu_vm_handle_fault+0x196
  186: ff e0                  jmp    *%rax

%rax is loaded via an R_X86_64_32S relocation with the address of label
.text.amdgpu_vm_handle_fault+0x196, and +0x196 is an unconditional jmp
back to +0x13e, the head of the second drm_exec_until_all_locked() loop.
This is the drm_exec_retry_on_contention() computed goto
(goto *__drm_exec_retry_ptr). There is a second identical pair at +0x194
-> +0x188 for the first loop. Both targets are inside the function; this
is not a tail call into another function. (svm_range_restore_pages() is
the inline stub here, CONFIG_HSA_AMD is not set, so that path is gone.)

So clang materialized the label address as mov $imm(reloc); jmp *%rax
instead of folding it into a direct jmp to the label. For the indirect
jmp objtool looks for a jump table in .rodata, finds none (this is a
single relocated label, not an indexed table), and falls back to
treating it as an indirect sibling call. The frame is already set up
(push %rbp at +0x5, sub $0x160,%rsp at +0x16), hence "sibling call with
modified stack frame". Runtime is fine, the jmp lands on the intended
in-function label; this is purely an objtool classification issue.
KASAN probably
tips the balance: the function is inflated with __asan_* checks
and shadow tests, and on that body clang keeps the label in a register
rather than folding it.

The drm_exec_until_all_locked() / drm_exec_retry_on_contention() macros
are used widely (amdgpu_cs, amdgpu_gem, etc.); the patch under bisect is
just the first to put such a loop into amdgpu_vm_handle_fault().

objtool question: should objtool resolve an indirect jmp whose target
register is loaded from a relocation pointing at a .text label inside
the same function, and treat it as an intra-function jump rather than a
sibling call? That would cover the labels-as-values / computed-goto
pattern that this and any future drm_exec user under LTO+KASAN will hit.

I am not respinning the series for this, the page-fault conversion is a
pure refactor with no manual stack work. Happy to test an objtool fix,
or to help with a drm_exec.h workaround if that is preferred over an
objtool change.

config: https://download.01.org/0day-ci/archive/20260623/202606232356.gwHMA=
JAW-lkp@intel.com/config
compiler: clang 22.1.3 (robot report) and clang 22.1.8 (Fedora
22.1.8-4.fc45, my reproduction)

--=20
Best Regards,
Mikhail Gavrilov.
