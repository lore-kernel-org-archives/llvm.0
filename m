Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3331EFFA4
	for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 23:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007837; cv=none; b=cFPavF/oCPxQ/c4Gdbgcz+8c8J5zeSdlshAqgymOru6TKHdoXQ9btMdONpX87wRKTdLk+EOGXC3o7gRdAgMqrTSfJgFJ7yM12/OQd7PgAxtglrvjE4ay6lV8tq95UR4uH+wF6A2IMesI4hLgN7iVXiSI0PDFw+OS29mEStqCCuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007837; c=relaxed/simple;
	bh=QHBkefvnoQ27PkxeG7M+C/KR4ZeXuhRpAwQYpDXPXEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=na2b63PIfU05hMWnD2nwz1NOCnMxX8WVFhLf8cZW0O0Yet+JBfflF3pz5dP09BiZuqvGu5CFlLikjAPA0Sjs97eNz9G0ZclEKajv2ST8KkiQtVdoV6mOj/pl+rQKTrk5+ssAwJGyK7SyP3dMqa1zjEt3PB+VUen/7hH9gYzL1u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aChQfwgT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aChQfwgT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso168714f8f.2
        for <llvm@lists.linux.dev>; Wed, 19 Feb 2025 15:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740007834; x=1740612634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKnTn46/4Y2PZeZ3N6KkyX0o2kLFr+MjBIJGyqLqLvg=;
        b=aChQfwgTZPgunphjIymV2MbVE/QFyAjAHSpQoam55gMrdPPY8ksTxSmAdQXSJddH28
         ayrYAvV6TRQCZjfhIhmoA8tXd/Bqrcgmd5sLKYJ3s2MewQfsXOop+Te4j2Rj45jOqn9N
         l6a/PsZvlszvzsKzGB3qVkootIaYsyTWbpsQX6mlIwnjDvfMKLWx3AI8AsvWQKY+18kd
         utDqq+hcMehOOi/y5nJVNXa97NV21d4HBM1EjTrchiJt+nLQR1L7XJLM+wPafv00lRBl
         FY/dUOko4fuz/2IyBQbwso0HF71bmw7jWRkTI5/SacPWF/P3vVQmZEuuQYWvRbGHEUoG
         0G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740007834; x=1740612634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKnTn46/4Y2PZeZ3N6KkyX0o2kLFr+MjBIJGyqLqLvg=;
        b=OzPX5kKXoHkmshkEmRf18M9huEpvKNHWT2xsiu5rssW2O/Si8narkokz+wA/QtMiyN
         EPe9Fdo7tG0IvAy9dvt6g44k9lYBWxsrOJmeLDpAJSWbZbuQ1QIqrv5g8tZrQjEMyleo
         MjdR/Jo4jtno2WHehhIUHuW6DmnHgEwAOvHSOQrDDeGc6TgSTZZalj05mmMsofx/Gh2q
         x7BBkD1OLkIHAIcQVvVAqrfT4DAT8HorvSaT7+PLNVLqCaV8QdTrPp4MkAqCpL1cAjgX
         00M1U57kLw0JHf9EdfjL+Q8TWordQReAHWvuHYSDehsPwyTdqw+6/zy2cjsjR67a6mM/
         yOpg==
X-Forwarded-Encrypted: i=1; AJvYcCX6GENNNu7XgUPOeNNmfBUFmxFRHifb50w0e9Xg8sRRKBFDn6ZxsS88lJcGvkfJFLPVCaz0@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/qUOQERmsKEoW4Y0gIq7qzK53cK/x8r//wqOKMIk3ygTKJd8+
	de0J6n73rZfQDeDB2EY1hbgbrHNj/bQhi9cgyBQNaaTEVpYmhCrX/FQmhSJdcdyb48BCYkRFCRP
	UwKrz7yDGZSV+agivcVrav/GuRA8=
X-Gm-Gg: ASbGncvFu/6GJ8nUa5/T1TDflMhAgvjPbKfO65YlxLWF/PRQX4iiIj1qCdSiU+qiuAZ
	hKzwZjYAsXPGJRJshP7Pi228FP19d2GOUgGHgrXXH1IQwgeyTJ/CKdmYKfm4tshGWg3jnPHp2lq
	I=
X-Google-Smtp-Source: AGHT+IHFGBp+H9LJ87eH9NcwjPr+u7W+cy6vGPQrVBD8VepuvfiNtoUe7umH1zTNOROzdxEEh6gwl0DkWMx2aD8oMrI=
X-Received: by 2002:a05:6000:402c:b0:38f:3b58:fcfc with SMTP id
 ffacd0b85a97d-38f3b58fe8dmr17435032f8f.13.1740007833626; Wed, 19 Feb 2025
 15:30:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com> <20f64170c0b59cb5185cfe02c4bc833073a2ebe6.1739866028.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <20f64170c0b59cb5185cfe02c4bc833073a2ebe6.1739866028.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 20 Feb 2025 00:30:22 +0100
X-Gm-Features: AWEUYZlmUvY8zJgQzvnlM_yf4TfmlW5I_F8Q4WL7EAI9RSu7Ct1C7vf6wwcX6ek
Message-ID: <CA+fCnZfyWE_g44tbbC5ugav-gufhjQiGugfdgWJV+Ae4Gff7WA@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] kasan: sw_tags: Support outline stack tag generation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	ndesaulniers@google.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 9:17=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> From: Samuel Holland <samuel.holland@sifive.com>
>
> This allows stack tagging to be disabled at runtime by tagging all
> stack objects with the match-all tag. This is necessary on RISC-V,
> where a kernel with KASAN_SW_TAGS enabled is expected to boot on
> hardware without pointer masking support.

Same question, is this needed on x86?



>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  mm/kasan/kasan.h   | 2 ++
>  mm/kasan/sw_tags.c | 9 +++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 129178be5e64..2fb26f74dff9 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -636,6 +636,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
>  void *__asan_memmove(void *dest, const void *src, ssize_t len);
>  void *__asan_memcpy(void *dest, const void *src, ssize_t len);
>
> +u8 __hwasan_generate_tag(void);
> +
>  void __hwasan_load1_noabort(void *);
>  void __hwasan_store1_noabort(void *);
>  void __hwasan_load2_noabort(void *);
> diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> index b9382b5b6a37..94465a8a3640 100644
> --- a/mm/kasan/sw_tags.c
> +++ b/mm/kasan/sw_tags.c
> @@ -71,6 +71,15 @@ u8 kasan_random_tag(void)
>         return (u8)(state % (KASAN_TAG_MAX + 1));
>  }
>
> +u8 __hwasan_generate_tag(void)
> +{
> +       if (!kasan_enabled())
> +               return KASAN_TAG_KERNEL;
> +
> +       return kasan_random_tag();
> +}
> +EXPORT_SYMBOL(__hwasan_generate_tag);
> +
>  bool kasan_check_range(const void *addr, size_t size, bool write,
>                         unsigned long ret_ip)
>  {
> --
> 2.47.1
>
