Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FED62D9EF9
	for <llvm@lists.linux.dev>; Mon,  8 Sep 2025 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362760; cv=none; b=VHsXkWoI+Nnkb7T37Fg//E57oWz383UOZtSMGTCvUM5r9/zPEe4k9JfaQWPEFyRR3qLOaare50SzPAR0BXwP2idQNmy8P1YZ6g8ESxIO6NJptz3rqn3YeXJnbpjDc07OA8+kwNhLhV2K2VQYtCfZSElXDjSqjjH4MgkjDBnHzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362760; c=relaxed/simple;
	bh=vT09vTia8SgQBO+FiegSxuy3xNGmzzHUSLwcepL1OEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPZPpr2oaicrmDuZPrVQNaIzp8yptb3EKDvWE/UjmKRcb+btCylDVyEMN+TodC/3xSVO6W50rpUxv3h4whLkdk7gXevsRdELv3cGuV/kVuGW43pX9rC5PZWBdevOspG0erRb6L5ed7L8/qx6QXXz6owgBB4/dSzJzdctFNdHNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcyFyUJr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcyFyUJr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso1582395e9.0
        for <llvm@lists.linux.dev>; Mon, 08 Sep 2025 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757362757; x=1757967557; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT09vTia8SgQBO+FiegSxuy3xNGmzzHUSLwcepL1OEI=;
        b=hcyFyUJr9dtHzJe5TyDNOv2YLh3YI33RqsGfT8x33i3uBxVdV7FGKZVaHVzXXG2EI4
         NwW+loFST3O54Cmp7m/Rbd9kVZVXUhpdbWJmYcUDByNj4ll0iL8igYrivIQE81nrmYNj
         LlyrauoY7AryHMw3GK9++WYAV8kvw8ANiQpkmkDhwDONb4lfJdpZRlXx4dnsmZBNdl0a
         mmF4mPTm065XsnmA/+7s/0BTYuu2eECkxFthAvvLj/n9n5m419lRDL3BiyvM6F5bb80R
         2E5Ogn7libFcVTfocUsD8u6//VeWHDrfKWml8slUOaa56JjyvPCr0AfXedTP3lT6zCkS
         /KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362757; x=1757967557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT09vTia8SgQBO+FiegSxuy3xNGmzzHUSLwcepL1OEI=;
        b=Hz5/3kyMBIoEfUvvNwjlATfExTAKFV9JdK+Qjcik7YadZC1Mjx7znv8klf5JlEwe+U
         AOBWClNTbccco/+gES+xwtenV6e3Qh2hzL9lBhPT0pPTcT8oBSyNwMVQ68t+2cRAPQsn
         nS/2tqCpvVhTR3X3v+INsjfHRAAHQadctAJ0+7P9ikIEB1QZhQtOVB+xJ0GWPgpCfkqI
         x0WI/rgmlBR+c2pEs9qLzd42r+NF/ickwMoZyLTx0UcIuuF5FPtgoxgIdQHK/O/JaSoS
         KAlaQiA2Kq7tnP5lVk/DegQMahbCwaCvbkt0cCjkI6A1TFjOpQ6afeQb5/nM8ZVdLdCm
         Tm/g==
X-Forwarded-Encrypted: i=1; AJvYcCUzfa4A8WdAPdq4o8fuQnuun2norN1s1zjFO8ZPvhSHmVa/fQmpNtZq5aZgnx5RKMX9VKxg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrmu6ysI0VaNv490/Lhzpw5UCwWepmZb6eJVNVfxgdmHPzVgQO
	o3MQs7KeRLHH0AvpP5Rxr8o3ZFQU593TBzJi9iR4PjzLjq3nT8CXYSdr1H43S93dqUJaVIx2Wq7
	J9gO3mlFQDrgK8aRyFNLa+OFEx9vldSk=
X-Gm-Gg: ASbGncvxsRE7PLLVfEZLt/rFo8Qf8sn5Va5LDLhN4vRsSRvwZQ+Y+qijrv100lAvEdq
	NQ7QIc6GxBARO+xrUerGFDqkHG/L2acAl70BRYXzvSOmr40PUoRl0kGNRKRK7z38BKoPyl9AWX3
	0krQOMvsJAzGfyq5CLsNkZrLB18dKoTQ0hKcKKe4Wi5nOwuBr2wWjAfPBeIzPTb+f4Oi4vMsJMS
	/NsNB/f
X-Google-Smtp-Source: AGHT+IGh6YqUFpx+JIdu/8YkqL5G1rRgnTznoIse4KvphEDHD6OBcCQt7Euav83er+DtfxdiEo+7p+GtKQrhaaETdWA=
X-Received: by 2002:a05:6000:2f86:b0:3d2:6129:5505 with SMTP id
 ffacd0b85a97d-3e64bde66c0mr9404161f8f.36.1757362756927; Mon, 08 Sep 2025
 13:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n> <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
In-Reply-To: <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 8 Sep 2025 22:19:05 +0200
X-Gm-Features: AS18NWBlgrNec5HQDqXuFdTg0l1auT_Opy5K148gspXva4oeYyeCVxabENuTdwg
Message-ID: <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:09=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >>I recall there were some corner cases where this code path got called i=
n outline
> >>mode, didn't have a mismatch but still died due to the die() below. But=
 I'll
> >>recheck and either apply what you wrote above or get add a better expla=
nation
> >>to the patch message.
> >
> >Okay, so the int3_selftest_ip() is causing a problem in outline mode.
> >
> >I tried disabling kasan with kasan_disable_current() but thinking of it =
now it
> >won't work because int3 handler will still be called and die() will happ=
en.
>
> Sorry, I meant to write that kasan_disable_current() works together with
> if(!kasan_report()). Because without checking kasan_report()' return
> value, if kasan is disabled through kasan_disable_current() it will have =
no
> effect in both inline mode, and if int3 is called in outline mode - the
> kasan_inline_handler will lead to die().

So do I understand correctly, that we have no way to distinguish
whether the int3 was inserted by the KASAN instrumentation or natively
called (like in int3_selftest_ip())?

If so, I think that we need to fix/change the compiler first so that
we can distinguish these cases. And only then introduce
kasan_inline_handler(). (Without kasan_inline_handler(), the outline
instrumentation would then just work, right?)

If we can distinguish them, then we should only call
kasan_inline_handler() for the KASAN-inserted int3's. This is what we
do on arm64 (via brk and KASAN_BRK_IMM). And then int3_selftest_ip()
should not be affected.

> >
> >What did you mean by "return the same value regardless of kasan_report()=
"? Then
> >it will never reach the kasan_inline_recover() which I assume is needed =
for
> >inline mode (once recover will work).

I meant that with the recovery always enabled, it should not matter
whether the report is suppressed (kasan_report() returns false) or
printed (returns true). We should always skip over the int3
instruction and continue the execution.
