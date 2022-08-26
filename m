Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F62F23
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 20:40:22 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-11c5505dba2so3484604fac.13
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 13:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VC/B2aCmREbDRB0d5cj7IYjvFuzN89g85WyKxEil/CU=;
        b=I5u/4u9xfg2i6n5MdfzykBxqej9aM0b6UotdtCa0cRUq2yhzyfM0K2p581LzqsiVWO
         xmYkDXQp5MSEwT2smBPj2y5aEXvg6nTFY3pQp6CBhaHdHeeONM66c9kHjZ+UXDYatISR
         g0stMzgpFGIX6YvU12KjCGgt1Cv/mzriqzzZHi0mfVypy29ZjpuAJiQ5jKTQ7vrlvg99
         2GNA4Ka1o0weBZPKCu8Gt8Al5Y5FWA600yuR4GRS8PafqY3rPDE+2Gk2AJUESgiHXDua
         tAuGqDUHmO3xhRUjid7aWYQ6jEC3uGOifEo9l1gnsUsGJqJfZ85eKOzbek/KwKcH+gpR
         gioQ==
X-Gm-Message-State: ACgBeo3/iYPEgPFSalJ7B2TBOeqYaGZC5YfF9vVnlGced6j3dhFvmJ/n
	KX6XZzIb1OnCvy5d5MtpA910DhVvzQFfb3WWXWI=
X-Google-Smtp-Source: AA6agR4Te3dKQ6g6TKR4BckswAseo5LxEUCtZ4KSfu1JnyrPazLFBIFV26Eo/GzBpNZW/s1MlD6JFM2mGBqa6Jj4oeg=
X-Received: by 2002:a05:6870:5b84:b0:10c:d1fa:2f52 with SMTP id
 em4-20020a0568705b8400b0010cd1fa2f52mr2722690oab.92.1661546421646; Fri, 26
 Aug 2022 13:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com> <20220824153901.488576-10-irogers@google.com>
 <2cf6edac-6e41-b43c-2bc1-f49cb739201a@intel.com> <CAP-5=fVVWx=LZAzXsxfuktPHwki1gYbV4mcmvJp_9GTDS6KJcQ@mail.gmail.com>
 <a9b4f79d-cdea-821e-0e57-cd4854de6cf4@intel.com> <CAP-5=fW7t9tcJpyUbv8JAo-BFna-KS6FC+HkbuGx6S=h+nBMqw@mail.gmail.com>
 <43540a3d-e64e-ec08-e12e-aebb236a2efe@intel.com> <CAM9d7chBnZtrKe6b8k+VYk1Nmz8YnNWSMmyLydH6+Otvw4xGeA@mail.gmail.com>
 <b0f86189-be17-d1e7-d23c-692eeee2b5ec@intel.com>
In-Reply-To: <b0f86189-be17-d1e7-d23c-692eeee2b5ec@intel.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 26 Aug 2022 13:40:10 -0700
Message-ID: <CAM9d7ciroc1XzRL+W34D5G7kCp4KCzRxjyRqnO2OXj=-ZaMTLQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/18] perf ui: Update use of pthread mutex
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 12:21 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 26/08/22 22:00, Namhyung Kim wrote:
> > On Fri, Aug 26, 2022 at 11:53 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
> >> Below seems adequate for now, at least logically, but maybe it
> >> would confuse clang thread-safety analysis?
> >
> > I think it's not just about locks, the exit_browser should bail out early
> > if the setup code was not called.
>
> In those cases, use_browser is 0 or -1 unless someone has inserted
> an invalid perf config like "tui.script=on" or "gtk.script=on".
> So currently, in cases where exit_browser() is called without
> setup_browser(), it does nothing.  Which means it is only the
> unconditional mutex_destroy() that needs to be conditional.

Yeah there's a possibility that it can be called with > 0 use_browser
on some broken config or something.  So I think it's safer and better
for future changes.

Thanks,
Namhyung
