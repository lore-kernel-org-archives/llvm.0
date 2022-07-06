Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772815381
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 16:01:17 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id h19so18846081qtp.6
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=hXDY2u6jMg7vkEvggtI5AB4RBXe4Hbw6rSIH74WebXE=;
        b=fFIEN8uCmrBxStKbvR2C6opnu9SDffnpYZ+kJERJiNZersQBDv+uoadi13EglEGxWg
         HoFTNiT4e6IHnxvBchc3s4ewz2IbR9r7iiFfrVUD52TAoDdPaXCKU+vxV6I/v3ItbvSj
         spKsCGG/3NLbXVr3k6P9DPEvh5mzv1l0in1zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=hXDY2u6jMg7vkEvggtI5AB4RBXe4Hbw6rSIH74WebXE=;
        b=mEnUcaSgXJquxHweFdDZ1fx7EtLBCcQnR93/znYz5E9wtzsbivDHTL1K4Kv5b4HH4b
         IuXIYiEL6oYtyt6fpXcFedCIW2pGbCM+kz/y45iaJKiVjVAj0pa2/zjWENsn+/e4c4vI
         GVmOJtPxyeD4h+BR2ovOgrqVNyR7XOIkXi8V0qVh4odNtjhazfvwv0M20ittrONJqxlu
         O6/a5+cvjkIeTMkXdocMWc3s/pLSth5foPst4PAGAEBt1kfKF5pAPg7aoKhoyntBKXSf
         awabQqsC+j8QVkQfv4jeVRpuVjGsCGXtERavqblI1JZHC4/Ylb8JFzU6SlEiUxlLvpul
         poiA==
X-Gm-Message-State: AJIora8qonnqkVlpu/60hmgZfY7aG17Oy0fxI6uECfVDJrN0KqlHgGco
	emythY9Igq18gnrZjYnGvKw19w==
X-Google-Smtp-Source: AGRyM1tbV9pEZEk3QSLJdDZqYDNgt+v0pheI01GB3Bv4jXB/ILGSjVhSfmfEpc4K/E6wOBk9JjZ31Q==
X-Received: by 2002:a05:6214:1ccd:b0:46e:7427:2626 with SMTP id g13-20020a0562141ccd00b0046e74272626mr38233187qvd.101.1657123275539;
        Wed, 06 Jul 2022 09:01:15 -0700 (PDT)
Received: from macbook-air.local (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id bp32-20020a05620a45a000b006a67d257499sm26186666qkb.56.2022.07.06.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:01:15 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Wed, 6 Jul 2022 12:01:11 -0400 (EDT)
To: Andrew Kilroy <andrew.kilroy@arm.com>
cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    acme@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
    Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
    Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, 
    KP Singh <kpsingh@kernel.org>, Tom Rix <trix@redhat.com>, 
    linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
    bpf@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/8] perf evsel: Do not request ptrauth sample field if
 not supported
In-Reply-To: <20220704145333.22557-3-andrew.kilroy@arm.com>
Message-ID: <d67dff7-73c3-e5a-eb7b-f132e8f565cc@maine.edu>
References: <20220704145333.22557-1-andrew.kilroy@arm.com> <20220704145333.22557-3-andrew.kilroy@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Jul 2022, Andrew Kilroy wrote:

> A subsequent patch alters perf to perf_event_open with the
> PERF_SAMPLE_ARCH_1 bit on.
> 
> This patch deals with the case where the kernel does not know about the
> PERF_SAMPLE_ARCH_1 bit, and does not know to send the pointer
> authentication masks.  In this case the perf_event_open system call
> returns -EINVAL (-22) and perf exits with an error.
> 
> This patch causes userspace process to re-attempt the perf_event_open
> system call but without asking for the PERF_SAMPLE_ARCH_1 sample
> field, allowing the perf_event_open system call to succeed.

So in this case you are leaking ARM64-specific info into the generic 
perf_event_open() call?  Is there any way the kernel could implement this 
without userspace having to deal with the issue?

There are a few recent ARM64 perf_event related patches that are pushing 
ARM specific interfaces into the generic code, with the apparent 
assumption that it will just be implemented in the userspace perf tool.  
However there are a number of outside-the-kernel codebases that also use 
perf_event_open() and it seems a bit onerous if all of them have to start 
adding a lot of extra ARM64-specific code, especially because as far as I 
can tell there haven't been any documentation patches included for the 
Makefile.

The other recent change that's annoying for userspace is the addition of 
the ARM-specific /proc/sys/kernel/perf_user_access that duplicates 
functionality found in /sys/devices/cpu/rdpmc

Vince Weaver
vincent.weaver@maine.edu
