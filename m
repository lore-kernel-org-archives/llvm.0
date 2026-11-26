Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795668789;
	b=pVSLcoSakCVmbFct99lcwH1M7b2SDu7SNGd84olFi9ftqJ2Ai+FXft8qDKUcUz47R8yB
	 vhXhlNZi+wQAYzBX1zg08Bxa/ca92yi4WIzjv/WXSrC7HT318J55nRr/EWx82pO962eTP
	 RbUUrvlBOF0DTafFXL158Z1Q5nxHhraypMjvmMx/7Xv5LJc6On/EC8UnEvAGbhPTe+KZ2
	 gB9lmztedn5aSXRSINbD66vFWxLv0mcmqpA5PBcNUkwhIBcXSG7Zy3zIsHfR6RtgiyoZz
	 2HQ/QCsEMgVxmwe3kNCzrTYPndE901RdVqHtWCRcQ7wpyHqyahLSGuqvZegc05F/xug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
	b=O3zZzMGkpP+0vASj+7LWT8kPqHMl1Djdvb3bpZ5kkFIeh3APlk8jMM+Bew4dxooGhTjf
	 xtKYPyRpphuEznIDX1Lo4oXe1CXjsB1WfNCY5u2Q2N8XMskss4mQrj4CwgDMh2Ay7dk7o
	 2H6xLg4MVp5DtVdUSYKgw9/qgAVinW5uSf5uo6h/zUtluyU16WNch7ngFS8UKqELXkHHR
	 0LSqgEjOwOfOQpYUTEL6A1zTqK0nTVMKoOql4DdkVpYLhC6xSKyJC77hY1fUDMDHLYoZa
	 80oj+Gr/o0kHskU9u5rmhQecG9ggcRpyH6x0JpXf8/18ET/DbuAIwcf3I+hhKCbQJLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wd+w00+j;
	arc=fail smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA0606A327
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 04:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFA0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wd+w00+j
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-54492d8a988so1599681cf.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 20:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668788; cv=none;
        d=google.com; s=arc-20260327;
        b=q/+DFlj9MCLLaXKF+fmitJpgITkBaOQcTxemP7AR+G6+dJnQJ27KaLVAsmQ/yiRjPi
         s4tegAa5Nx+AaZUZI0gMOMTlRKhOahMmgtZwJNNj5Jo/0oIi1P1cuLrAW2JApHBIgCJG
         +lNashMI09+PkjGOwLEc+JQHK6dYns1hbzwo2bdePLEoyTYwRQUeLULq34fEtzqSdNEc
         IOcA08L4Pnx41o2+HrvTUrVSm3rmZPWPj7bhvTOtq3ap3psRmfBZojvcGTi+IYX/5TSo
         99NMvcxUSNazxib7e0k5q5G4E4Q0IrJutFdnwbAb5hnmPg6mrfFul2eR13dmZi2WAJcg
         oDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        fh=HkvxcEqRYA1nO9AyrIaolYaTM8lePIuHetFPd+JyrYc=;
        b=WJzYNHFHsv9SQFspTtKr/J6EFQhr5LGdl0UfOKKLZGdyIh0MfdM7RFUJNTNg+7WL+C
         y4eWpmWDFDPJWOezCNDi3UVa3PsAzAGaY9Y0u3MmsK75oZO0uFR0WW+tdanMkIqt/Amn
         gU8tqNmnAYZxEazsPEB0n/URkCWoB+9qUEUSAMvn5y0LLH7vp9huVXjJqWM0tFd2s2T6
         dzIG1LHxh6MVEeCVbbgdWkjx+OWd/suCRksx1a7ZPYsnRf9K1DHxG7/aDHKIH1d1eXEh
         a7IG3kmyNH0iBYKkGlN0Vr4CtoqWBNTQcGtPxK8nT45HvuvxnR6r5gBaAmKup0fPgDLC
         /CJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795668788; x=1796273588; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=Wd+w00+jwprH2Z7WaB0z9B+eXn8VFSBg9vXrPggY+8dvXkKNWOGXmmPPgXtKo2cs0b
         1Nv6r3K5sy9ukrueHL7Qd1zX0NXV9GwTnkcV34yL+j5AzAfXphYvGjTiQOZKel26sS0O
         RESaNfPrqDL3xjKl+UIAQ6h+6TKCeoZdfhY6ngrtyMs5l3QLeK+f4hwUCTTSC57hfcsx
         SkNmH3CbqFox4LsvPxIcdRg98abwh0ObP/OSXed2HoTnMOAOfaT2jlHrXmEIlsp55aFf
         gEQ3c2lOlTlHAblApePu2yA6ObqmDo42EdaxXuLX1Jxqqx9ZB1hLJqzbeUdRef9VS85k
         0jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668788; x=1796273588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=dMfUPqRjJG4Aow+EkTnqjOJOjd49MREajNtWK8+C2dqpRzr0lCkinftP1NtUdRlRVB
         GSRRyVIy0fqf3Cgwenb7oxSDpHHA1uon66+yQsJrw9FE9N9dRNPpN9C590BZrACXiOJ2
         0WSBYm35fH88crBTE8C/aPY8qPcX6/ZM23zf5GVtLgCSwoFjbqdcQ8+m/5+fLMlpfwGT
         Xc2aD6ry5hJ8NoDczwLzAVNXp4ea1qVnfzvUXT8C23iy9dyE8K0OtrAK5KUM0M6dSDHh
         Dtw0Dl3KSbCUPSsEsr6XhI9RftRv6S/gjVKWbYYwaW4X/d+JtGvaal7+gjSBE+AUPMc4
         tsIQ==
X-Forwarded-Encrypted: i=1; AL+hErG3ssBPFwoOqdER6YYszezHC2Yb30uqZCzSlK5rg+AzEOdxftc4VNbZhvJrnA2pAKC2M0YV@lists.linux.dev
X-Gm-Message-State: APuU4Z8F5SsGAly78Fr+BRCzQQbH5QxAv0Bwvtkv00mXwAXJo9IKAmDX
	vB/UQRS6dtns87hSokUL/xRhuvXNg9n8Y0NypPyWHlKVDwXerKdTBDn/dBKVpn5k0mVX4hWM0l3
	EIttRlMvA8P3r3QQFvUeg5vA6wdFHc5Ce3butOfLD
X-Gm-Gg: AZFdTZfvlFmZnRFMIJUxJQ0L8rKoFSb9Hc7swQ4mhNAXof3dVDJibRcAHk+mGRvKrcl
	6840QLIsiag1Gy6BWArqlpe73oaGQVcl92KMqZqIft/OjiS5grnuf7FOPwDAlOoJszoyFYp4/3o
	n0Lw3r/iDeOMpxJO+Rvxt5s4M1diKPZWc3afLKD7qfGXV7ALE5Jy0Ls5Jz80AQfAA7ZD7k9kILP
	doTbMZ8oLs0/i0am5HNOTJuT7Qv7y2rzE1hRvX/Kqn7wQ5PtRtuLEHkNmSG9jUOAIoRd1/31FIB
	7NM8pW7RADLZvgZzrpklyGJ7fAbATpKC5tmgfgGVqvCfKgqfsfhIhjvEkan0QUX36ikOuY5LCwo
	umFdeVfHyzPl3JSt8jWzY38bsT5KDlDFlGRXfVSMw36uHhHVb9xpjYukfbg==
X-Received: by 2002:a05:622a:1e86:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55d88127bafmr101738501cf.4.1795668787640; Wed, 25 Nov 2026
 20:53:07 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com> <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
 <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <20261125132225.00254c37@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Nov 2026 20:52:56 -0800
X-Gm-Features: Aa3M54pMQmXw5Cgtc0EakW9NOiIZs8STgUuBigJfJMSZlzejGTE6XZMetCnzc-8
Message-ID: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for user
 and kernel space
To: Steven Rostedt <rostedt@goodmis.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:22=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Wed, 25 Nov 2026 16:28:02 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
> > A quick question: how do you plan to get this working on 32-bit ARM whi=
ch has
> > its own EHABI?
>
> Do we care? Isn't ARM 32 mostly deprecated at this moment? Or at least no=
t
> adding new features.

There has been recent work on both MIPS and Alpha for perf events, so
supporting ARM32 EHABI doesn't seem unreasonable. Devices like the
Raspberry Pi Zero W/WH, which use a 32-bit CPU are end-of-life in 2030
(according to https://endoflife.date/raspberry-pi ). It is
out-of-scope here, but extending the kernel and verification
infrastructure shouldn't be hard.

Thanks,
Ian

> -- Steve
