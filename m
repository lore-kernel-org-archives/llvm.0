Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70626B087
	for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739461384; cv=none; b=qxdIpM+N1cts+vxOkk08DX8bd3isbC+gn+pPs+CbP0sJZaUxagh/sGC08tiNAHyMzKq6nWagF/+isUBmMpRZSFVGu9Pr3jXLCFIY0Bq0SHNDFj+BzIUaA6Wl6enDLi5xf2obH+EntcIB4ct3p+o6Z5iW4rFr7zQjM/NX7kS23x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739461384; c=relaxed/simple;
	bh=icdXS8p68rQCTSX1pWN2XJTVSdUQQv7nxWrTiZumR+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEFczMHcE2SvWd8XM00iwwC1pVrE+LX/FYWKYb19toLd/mvcD6G3ujookLX2jWL83ZmmWbCmFReJuVHc4KQ1t+1dbfAMN2PRWGn/v1zPHS5kiJfD/sv6l+Jcyx0GA5rlOjv/MmBFpJ+nOcNhlG0KZ6FWaUCpeMs300mhv6KIDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUqEkAO0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUqEkAO0"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-308f4436cb1so22172061fa.1
        for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 07:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739461381; x=1740066181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icdXS8p68rQCTSX1pWN2XJTVSdUQQv7nxWrTiZumR+I=;
        b=bUqEkAO0+jk5+Wx32IERotFcHmxJx7d4Eb8u4HwPIKLMepMAS3A2nZxmmHisMsWjq1
         ye4oy0fCKWi2x0uGvQzh1ok9wECD+KI4x4dJXR18oYVFEiuetsLholD0XvWojK4Z9Lvq
         jR1LhJjEsNOJ5x2fi+fHfARojzmO9aRzUdqYswwjdSKicekYIh+GABfahrHLzrIitovY
         tVShKbQucYLDAInhrO7H4o9Y0NSVsYDNejvhHH0/HrQcw5wqp3Ri0msOYQ0l3vAWYXOm
         95Qq7YswRen3cm2kD73Sj7oUeHEJUnW+gp7yNT/yqa0GR1AsiEU/qnfNak7j/f1f7Mxf
         UBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739461381; x=1740066181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icdXS8p68rQCTSX1pWN2XJTVSdUQQv7nxWrTiZumR+I=;
        b=BSuz3Csfns/T4VUfOt2ivf9Kkm9CAjg7nk1IJkBaA9IohKzf9ZkvXUXr6AN6bNqk+p
         6nTeV4FkstjZeneRqLB3lktepEkhp62Un3WRoEVwciAkmPlcqHbzqz1fjikGupURotak
         7JEoJYcbu82rkXtGiDtdw0bRykMgIDtlPiXMX205XFROkPnONQT5Ngr/bDaVctAiX8uD
         8EWE2ewQ5gYXZNM4EQ3RhxfIXmxNY7ml/pCDlA3JZQPk2yAUcbOYPYo0Rs+mcD2tdE2W
         k2G2srz8VfedqUE9xoyZP4gtU07JhGt8Zt10hOZEB4k8RiIWRY7v/7CnpW5ei8K3jQ6n
         z+hA==
X-Forwarded-Encrypted: i=1; AJvYcCVbo6gCrQsa1RGMmgmEE+OmS/ebzWg+YREpNh0QJVBT8RFD7tiDY+U3rZblLNm4vq2zOHYr@lists.linux.dev
X-Gm-Message-State: AOJu0YyjmLbvH+jL9WRndf5IIkVIhkSLsuDTIck3mtpqc2Htd61lSRpy
	LJgfz5LTSLtQDK5ySg68x5kXj8sTlkNSfqwmSGPL1Nlohj1yYnJchjqtXpIfYHkqPpBuP5Hag1K
	FxoF0e/pX8kjD2rc690uqPyMEs6E=
X-Gm-Gg: ASbGncvwAe03JnWUBCaFKsM/2ozFrCUN9l47w4LEGdq0s9NxMtRmWMkBWQCG2lJwjM/
	Y63PEf6pXK1rlKctrrcnS+Wv2QzVJfo2qwf5Tp/ukKLaPcYmvNCASTya/RBZrhzs73OXQLgo8Yw
	5nIuBPQukgPIM8
X-Google-Smtp-Source: AGHT+IH1DgGXOv9U05OxLJT05mfmUcX32MdUYL+UbmMo6S6W1PrqB+heOS5OeNphPyVdKvsISm/TxAN5RBatuANrYoM=
X-Received: by 2002:a2e:8887:0:b0:300:17a3:7af9 with SMTP id
 38308e7fff4ca-3090f3bee24mr10560491fa.19.1739461380591; Thu, 13 Feb 2025
 07:43:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250213-ww_mutex-kunit-convert-v2-1-4a60be9d5aae@gmail.com> <20250213115951.GF28068@noisy.programming.kicks-ass.net>
In-Reply-To: <20250213115951.GF28068@noisy.programming.kicks-ass.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 13 Feb 2025 10:42:24 -0500
X-Gm-Features: AWEUYZnmsQRxlJial_Srfud0qxhtqGpvdrhg2T7ZQYxl10OhVwKIEsBPtxdK_Kw
Message-ID: <CAJ-ks9mzYWSvVD=PCvCBohXg77BdFODq4ePMNstkL+70tkU5RA@mail.gmail.com>
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

On Thu, Feb 13, 2025 at 6:59=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Feb 13, 2025 at 06:40:20AM -0500, Tamir Duberstein wrote:
> > Convert this unit test to a KUnit test. This allows the test to benefit
> > from the KUnit tooling. Note that care is taken to avoid test-ending
> > assertions in worker threads, which is unsafe in KUnit (and wasn't done
> > before this change either).
>
> So this was something simple, and now I need to know how to operate this
> kunit nonsense :-(
>
> How is that an improvement?

Hi Peter,

David enumerated some of the benefits of KUnit in another
thread: https://lore.kernel.org/all/CABVgOS=3DKZrM2dWyp1HzVS0zh7vquLxmTY2T2=
Ti53DQADrW+sJg@mail.gmail.com/.

My personal reason for preferring KUnit is that it's much easier to
run from userspace; the tooling takes care of building, starting the
VM, running the tests, and producing a human-friendly report.

Anecdotally I've seen evidence that e.g. Intel's 0-day runs all KUnit
tests but not all kselftests
(e.g. https://lore.kernel.org/all/202502090223.qCYMBjWT-lkp@intel.com/).



Tamir
