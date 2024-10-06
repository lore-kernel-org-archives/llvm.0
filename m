Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3B23B0
	for <llvm@lists.linux.dev>; Sun,  6 Oct 2024 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728173213; cv=none; b=X32SnwhFKgpIDtURy0l0iWrQgIfZEp+HPG5DvhIFdAqYB485vNk9duVlS1QY/Fhvn8cD4c5Op9scquYdpjvCqlAVLFmGVrrYWXaFg0uzUE0+jCJKk+fsKxWKZ4LXFn5WCbNFm+LQ25o/jy+CgAz4u0OA2f8vJfYpcN+vAFdwM/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728173213; c=relaxed/simple;
	bh=7PhV7mSmrjXdm322I5AhDI6uiC32DXT2Ek81VrbJ7rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itf9WRFEC+QoT23B3PMUfvKjfq8kbAtpDUQf0AFCfD1NOZ3RJduMq8BWzt5pwmDsLT0W9dM44odTzuMZa/kcw3DwNlUZ7p1/EfEhJuaKkUp74G8++65p0zzct3TddDcWHDsGu3Tg8pbwf6iUwuyrsAWs1fe/FFIwBA9lD7WjbsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RtrQsUd8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RtrQsUd8"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c882864d3aso3569541a12.2
        for <llvm@lists.linux.dev>; Sat, 05 Oct 2024 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728173210; x=1728778010; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=RtrQsUd8et5irRfCD6B0LQchIzOa0MITG4/dir2qiBTxTS3NuriXo+cDFPVn3bcSrQ
         Oij3nb/BDn4CYgEl3kADhvVQHdQdQlxnMJSqDJ3pml820xqjam/B2t/7qNeVvpr5tCMf
         qiRN9WwKenQpD9tYXrqWZnI7slZpQcKQGIOkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728173210; x=1728778010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=j+nB92O+s0EOSukNpDNFC3UB6leqWO5GBK+e8mnDiwvRDhJczK2NTSJzXQr4lRc0+8
         E/UKnUVAiOUBoumfrHsV2wzxmOqT7+UEUr4HoiijdXrdwJKczP5uOh7y8Mi1WwQyA8vV
         VO0+9aicfXJUUkxyVatC/TeNOSFuxEQK91C5qxBBsCa9FVRkaQQk4NayU+/IQGaUMEob
         K8NGC9drtvE9cx7cb0RWjdVjzNNnKq8KUALPNhaW8PK0kCIHQdWASg5SKbeqvx5YkvfJ
         oYngSo7AV6StuUW1l3MZHlllu0OJb8dfa1Cc5YQRnetOH74N4JVotDRMX8Qhw7/I14xD
         1Gwg==
X-Forwarded-Encrypted: i=1; AJvYcCU0xJJlRoJLfsVsRYiY25dccH0/3y5NAd6osBo8jtO7Wfqpw2SfWG5ESlcDQqY9rdkYzHom@lists.linux.dev
X-Gm-Message-State: AOJu0YzE3ofjH5nzmM4ZfA1FVRdIuMi7D8swG3/jITgPOPxWMph7uR2Q
	XtTmeQKb6G1uWqYDcurOmpIb1kyztGgFw0iGTdLC/Yoja6nPDsVjVZhjIYSJgCCHMgEJDgNZE6X
	4lo2oMQ==
X-Google-Smtp-Source: AGHT+IHExMeogcrKhJQhdIuw/vno0bUWB8G6x7a0GZZanCZWjEX3g6JVnQCjLpH3/0JROM1QmqXeGw==
X-Received: by 2002:a05:6402:3549:b0:5c8:a01e:a06d with SMTP id 4fb4d7f45d1cf-5c8d2eb2cf6mr5875543a12.30.1728173209825;
        Sat, 05 Oct 2024 17:06:49 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05f4e93sm1468252a12.96.2024.10.05.17.06.47
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 17:06:48 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c88370ad7bso3904637a12.3
        for <llvm@lists.linux.dev>; Sat, 05 Oct 2024 17:06:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmuuuBX8ZnUwSCCwsdLWo5AWMdCFWu+rmV0u3Bz9bcUWTtStHGmqghYjqkpbwO0r0pF/OJ@lists.linux.dev
X-Received: by 2002:a17:907:9693:b0:a99:3d93:c8bc with SMTP id
 a640c23a62f3a-a993d93cc22mr339286866b.13.1728172818387; Sat, 05 Oct 2024
 17:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
In-Reply-To: <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Oct 2024 17:00:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Oct 2024 at 16:37, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Sadly, that is not correct; neither gcc nor clang uses lea:

Looking around, this may be intentional. At least according to Agner,
several cores do better at "mov immediate" compared to "lea".

Eg a RIP-relative LEA on Zen 2 gets a throughput of two per cycle, but
a "MOV r,i" gets four. That got fixed in Zen 3 and later, but
apparently Intel had similar issues (Ivy Bridge: 1 LEA per cycle, vs 3
"mov i,r". Haswell is 1:4).

Of course, Agner's tables are good, but not necessarily always the
whole story. There are other instruction tables on the internet (eg
uops.info) with possibly more info.

And in reality, I would expect it to be a complete non-issue with any
OoO engine and real code, because you are very seldom ALU limited
particularly when there aren't any data dependencies.

But a RIP-relative LEA does seem to put a *bit* more pressure on the
core resources, so the compilers are may be right to pick a "mov".

               Linus
