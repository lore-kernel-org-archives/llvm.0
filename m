Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4470263F25
	for <llvm@lists.linux.dev>; Fri, 14 Feb 2025 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739536707; cv=none; b=IATd+aEPCgsyjyyX7CVyBk2H8Te2SUWmLUruBsV0hPEEnDDDchi5Ny68py4PFtEEoXGY/G+KY4n5kkQH8mV+Iv4WKqNRGOOb4bYpaTb/XpsAYsT2RSj1EY+G+EYEe4b++aSjz8f85NLYcZdS/ZXxp7/a53X1UdSH2RQol7TT9zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739536707; c=relaxed/simple;
	bh=gSPu3zaINtQ2hE5QQA984vUerqIGwHUTIQ2qvK166l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XY+3sYE+r3EzjUuA2cYPF+jI20QNTvyy26+nJbWtAxThTPsMe33NgSKLj4tsumUwjkC1Ck7T1mIFt1910HNIxdzss9VvA4U8Xq0b+2UAD7i4qxSBs7uGnh6riHiIRnyeA4k/rmpPOSQ7UPak5TX9PCgIH2QlI6SGPGpZTmPIcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4Vz50rX; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4Vz50rX"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3076262bfc6so21300441fa.3
        for <llvm@lists.linux.dev>; Fri, 14 Feb 2025 04:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739536704; x=1740141504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSPu3zaINtQ2hE5QQA984vUerqIGwHUTIQ2qvK166l4=;
        b=H4Vz50rXWhU0mp03hC4ktrioHDlj5cEWRhFYCbUE3RKklIe9HlOadIcqM+V2B4jrH8
         5RnU/BdAYu+WfK3KMsqIVSBApj+k9ncXWe/x1gBq0OhaaKhRPcT+Tln9YlvRLWpis+uW
         x3QrFs689h5ltqcewheQM8mCK6Eh744+DXx2rVur0rCAr/LDycJnuN7MEhstDMIkuHf8
         4M25P55/J1+ZOI6u+NnT01m75EzkBLJyeCGPa1ToVykk08QkA9lMrnLUQvLZqQE3f0Us
         hjj1Si+TKom5Lqq2tWs6RtQgQeNhhJ4LIBqtrA1L8cGzD4TyeV6EjKGiw9h1R3mGm1t3
         b/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739536704; x=1740141504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSPu3zaINtQ2hE5QQA984vUerqIGwHUTIQ2qvK166l4=;
        b=bv72hsnuuPImXOnyJTOpzO55xOiqY89R+FHLrvJD5aI9SCnrZSsKalhB+YETEVDbRn
         pVlIDHGxzNhSCZEHf607SHGWesz+1rFHa1ZslFFfMOx45HLmUMTFED1QdhDG92SDu3D8
         hI1/wcbKilwJ/TQ+daOuBOYK+qiMXsvwwTiopiAxS6DMQA1jxLkDdQcZqUFEcDBR1Y8L
         PjaAwM6oNqFHGHXGBQfUsVe5ygO/dDpGnI+BA5iBM65XVJ+XSSAa+EMdI3iiizo5o/T6
         ZfkD3WctpKWKtBxr4j9ZZcZBupO6Vkg8YUzRvy4cKnDPVaXXsf1MvK0lawN4Uep/k2oM
         sOMw==
X-Forwarded-Encrypted: i=1; AJvYcCUdtO2XMIvBpk42xcccyhWfcgaqiAxdGEZcO2yL1nHAbl2iYUcqvafmbSosX76NAgsU3JNF@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg3owu15r9cvhr5VKF4Dz3i7ndL0o4D6/KvDZIPONXsRrkp1G3
	psFYWh5sVOUso7LpgRLOBTXnNbPSoIzCq8XojsyiZGc9VStabJE3KE5y2knCH4J0oKx7D1fDVgI
	JcXFjWPxrfXblXOkijn9RyHCA+Us=
X-Gm-Gg: ASbGncshncCKMxbTHf8hmVWzZETOFjDcJvLKccfEbXcgkaP6YNbvR63J7XOcCffwM+d
	AwS1ccAWCF+Q9HBlJYE4eSBF4bbzikACWa+HqLlI3NnpNHqrPeYjUi+rC9yF1SZKuZ5S6EeHOt0
	kpJplgFYcgXiQrW3Qs5Bt/tvTkcMqtfr0=
X-Google-Smtp-Source: AGHT+IHGTYfsLVh9BXq48a3Ayem0jia6+jW2kw2BEwO0RvsU7V2GFEsuZ34723RE7RdhTAMfDl91vlkNlX5oioY0wFA=
X-Received: by 2002:a2e:be84:0:b0:300:25f6:9b3d with SMTP id
 38308e7fff4ca-3090dca0d0cmr28127421fa.10.1739536703681; Fri, 14 Feb 2025
 04:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250213-ww_mutex-kunit-convert-v2-1-4a60be9d5aae@gmail.com>
 <20250213115951.GF28068@noisy.programming.kicks-ass.net> <CAJ-ks9mzYWSvVD=PCvCBohXg77BdFODq4ePMNstkL+70tkU5RA@mail.gmail.com>
 <20250214094856.GD21726@noisy.programming.kicks-ass.net>
In-Reply-To: <20250214094856.GD21726@noisy.programming.kicks-ass.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 14 Feb 2025 07:37:47 -0500
X-Gm-Features: AWEUYZk-wm4aTyenMdT75V7ZD2MsmSIdQL5n9jNliiKDXZ4mzVb7Lg0L8-G8dY0
Message-ID: <CAJ-ks9kG6g8v7ADJkpuwekg_87iDVq-hPcYR+Oobrrjb-a8hfg@mail.gmail.com>
Subject: Re: [PATCH v2] ww_mutex: convert self-test to KUnit
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Gow <davidgow@google.com>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 4:48=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Feb 13, 2025 at 10:42:24AM -0500, Tamir Duberstein wrote:
> > On Thu, Feb 13, 2025 at 6:59=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Thu, Feb 13, 2025 at 06:40:20AM -0500, Tamir Duberstein wrote:
> > > > Convert this unit test to a KUnit test. This allows the test to ben=
efit
> > > > from the KUnit tooling. Note that care is taken to avoid test-endin=
g
> > > > assertions in worker threads, which is unsafe in KUnit (and wasn't =
done
> > > > before this change either).
> > >
> > > So this was something simple, and now I need to know how to operate t=
his
> > > kunit nonsense :-(
> > >
> > > How is that an improvement?
> >
> > Hi Peter,
> >
> > David enumerated some of the benefits of KUnit in another
> > thread: https://lore.kernel.org/all/CABVgOS=3DKZrM2dWyp1HzVS0zh7vquLxmT=
Y2T2Ti53DQADrW+sJg@mail.gmail.com/.
> >
> > My personal reason for preferring KUnit is that it's much easier to
> > run from userspace; the tooling takes care of building, starting the
> > VM, running the tests, and producing a human-friendly report.
>
> Wait what -- you have to run a VM just to use Kunit? That's a hard pass.
>
> If I can't simply run it natively on my test box, its a no go. And it
> using python also don't help, you shouldn't be needing that to load a
> module.

The tooling I mention is all optional. You can still use modprobe to
run the test as a module or at boot. In this case you'd set:

CONFIG_KUNIT=3Dy
CONFIG_WW_MUTEX_KUNIT_TEST=3Dm

and then run the test via:

```
modprobe ww_mutex_kunit
```

or to run at boot:

CONFIG_KUNIT=3Dy
CONFIG_WW_MUTEX_KUNIT_TEST=3Dy

Link: https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips.h=
tml#running-built-in-tests
Link: https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips.h=
tml#running-tests-as-modules
