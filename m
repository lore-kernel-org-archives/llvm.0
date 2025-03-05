Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8317D2
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 00:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741133071; cv=none; b=VYKPaoB/sJQVRXskdPaU2w8yXOvNz9/nuuVy4nBN6xx5tdx2diYGZFJjU0QLZIHJS4iVBD7pQ44INcxu0oiw/vP7A7v4zDNx9gavsyg/Fm7UtGpNz6OP6kcyWmyhh4eBBC7DBEbXSmgAXDLlKpj/XzncAkkHRpYQaK01fEfJJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741133071; c=relaxed/simple;
	bh=obB0h8AHDTv9/LrRGXUTQqWYXLHGR7G5bwHes9VJzA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZWTFhtJsxb7RGM+JrpwBcVlnD1qKeYTb7+0KaGL2Wf/lY4ox1hkM6iuvU0O2C/ZxMVeix9ZQ8xGehbqWbw1uRg686aXuMTAuNkN1zNPbI9eClsBCNIhix7TgPfcdJzs0lJnS38dBybApo2qEziRylaWGOwYx97MaRktVYEOiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=chrhQ11L; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="chrhQ11L"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22328dca22fso93535025ad.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 16:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741133069; x=1741737869; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LM4+VbDeQgzb/55NI3t+9R4dHqP/5jKcZhBFBtOBqBA=;
        b=chrhQ11Lx80DSTkwQR/QeNDyODdHEkI7Zno2gzJEZLROa3/ngriJNah3tyn2G/rTf6
         /eHVesqzLvelYsFkNIuNOt4grXiXopZEBCS0p1HDLr6yMbpTCvJ+eI9c12FbcBZ+kVEQ
         ibASDvfoIHVC7O9xb93tVv08MROoG7ynsReV26UyTewcSeLXoAf42TaxeU/zfeu5gfk6
         T5YcUQxzQ3/8ODkaTmovmRRGaHJZDdRZxHMQiL7v3gycMPmqZdQw6TZDCKvIH9BUatM+
         Vb0+9A3zmq1gO5ujyexor++8JNgfLtDutKE5A+LUJSkiTUxiRLpCHLd14DJZuv4KBQKR
         z0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133069; x=1741737869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LM4+VbDeQgzb/55NI3t+9R4dHqP/5jKcZhBFBtOBqBA=;
        b=l24aSFclqrHbVtXuu0x5302qBDsbE4mjqsbzfbfjWJzrdI7buTbwwbcbzfwTetyCuL
         Yp7x+qgBuIt/sOIV9asyeSD5G7Ti8TM6qkCYlGlWY0xugQNTAMOg77YZHr7Q8Dt+N1Os
         zJA+mRFZMOqIJvkHpuhYEmjejgwA9j4mlJjZCJrcm0R6okDaA4RHZ1UfFklO5YGnLNA3
         UqpV/2O5h8LUIPqB09t5OFYbOtgVNKB8ulDCyMXhaZtUbcgzIYfRHJb5aQhr1zXzLhsS
         yS8KkxlxFY/PE8Iw2hi0h6wzd2BrN5IbnGhiSoYs76mlBgvpdSY/GCMjftaGRRuk2g5a
         gVjw==
X-Forwarded-Encrypted: i=1; AJvYcCVXuKH4I6ZwgeRWGhwddIsWze8mwRzETSHtUikJyKbefMVH45qwZPn0bGCt8Ov2bmcFdbB5@lists.linux.dev
X-Gm-Message-State: AOJu0YyUAAy1yYZqiQXbWakHCxjLinRnJ8wohdq3BlGpVRKl8EwmXFjA
	mF3g5MT/82iKxDp8LpHO/Um+ux/sYYVHEMNSHcm6+tJcD+WKl2Y+Uhw4g/N3flXnMQRDtip5KCu
	X/nGSd0EtzrxJYTh1p8yCcH3oA0doXNNfcMwm
X-Gm-Gg: ASbGncuNSZk6wRPMVOL4BV1nU9K957u2PthOtTA5niXfNVex5nkADOzs/0EsRSZAc/7
	1xA6ETpuSgfr1DCPrm2iih0V+amGcr1Hkpf4fTD6/AHE44eiDk0p+uLy2cLjoyy2LAuNPpyThPc
	1hIETaoqQR/wlOQrqlOBoyaVsJPcrmo5BaltvtJBxMZK25odl2IRYuXQLR
X-Google-Smtp-Source: AGHT+IEtISi7Tlt5kX4zmOO9FEZtWXEEe9J/QPKTHvSqVUkwchS3k7u+aPOlcVNfd6t4Doh8lMUn/x9+fE5ZVoRcpzI=
X-Received: by 2002:a17:90b:4ad1:b0:2f4:423a:8fb2 with SMTP id
 98e67ed59e1d1-2ff497cce8emr1999183a91.20.1741133068525; Tue, 04 Mar 2025
 16:04:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com> <20250304092417.2873893-4-elver@google.com>
 <41a14b09-9f09-4abe-8caa-89cfe2687562@acm.org>
In-Reply-To: <41a14b09-9f09-4abe-8caa-89cfe2687562@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 5 Mar 2025 01:03:51 +0100
X-Gm-Features: AQ5f1Jpv14gcn7aAs4yWXHhRLBF4i5EQTdXxL-iYYKY2gY0B-tX3E5j-KtDZzBU
Message-ID: <CANpmjNMYoRTj3F1L9UCp2gHVbVZw0ieNnk0xPZ8Q--BhFCy7Ww@mail.gmail.com>
Subject: Re: [PATCH v2 03/34] compiler-capability-analysis: Add test stub
To: Bart Van Assche <bvanassche@acm.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 00:52, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 3/4/25 1:21 AM, Marco Elver wrote:
> > +#include <linux/build_bug.h>
> > +
> > +/*
> > + * Test that helper macros work as expected.
> > + */
> > +static void __used test_common_helpers(void)
> > +{
> > +     BUILD_BUG_ON(capability_unsafe(3) != 3); /* plain expression */
> > +     BUILD_BUG_ON(capability_unsafe((void)2; 3;) != 3); /* does not swallow semi-colon */
> > +     BUILD_BUG_ON(capability_unsafe((void)2, 3) != 3); /* does not swallow commas */
> > +     capability_unsafe(do { } while (0)); /* works with void statements */
> > +}
>
> Is it guaranteed that <linux/build_bug.h> includes the header file that
> defines capability_unsafe() or should that header file perhaps be
> included explicitly?

It doesn't come in via build_bug.h, but via:

  scripts/Makefile.lib -> "-include
$(srctree)/include/linux/compiler_types.h" (all TUs) ->
compiler-capability-analysis.h.

The things pulled in via compiler_types.h are treated a bit like
builtins available everywhere implicitly.
