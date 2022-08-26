Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5B4400
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:05:25 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id bu22so1990880wrb.3
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Eve3FE7hOWsinCveAVX9btkiK/Cf9c1/3T/dGcwovAU=;
        b=oIRAeTZZXtyEI1qVYgsm+cggY3Mliak5OfKLrgEvg4J3HtAne/Ixhy4qpZ133xXkTJ
         XluRuBLn7hv8hPkqcKze/kDl/7ya7eh/LlXvhPCmLXW9kFiadRarEmHnjOoPx4KZWFsr
         TMSZnRIR9VmuC6NnvJG67u7vGhVkmuJ6YvfwH2P8iV79r9wMpIrpnzigtzjsGmPPnFzr
         CyLR5/v0RtXM+mOXxcMfIzBi1l37XxC6NmxbWgYowtAmd7a9uicTFeQdS9DrEK6adLTL
         YQpr8yz/qFSad5jhr0bPxzG0o2bIYS5wa2H4zeZenCS9B8O8BRwBypYy4kGVIb6x7D07
         D8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Eve3FE7hOWsinCveAVX9btkiK/Cf9c1/3T/dGcwovAU=;
        b=vc9Q0oF2LQQxKoxLJPmFJ+hX5I3kbcJ2gW4nLPfxhBWEnxy/X7p+iapgD/yP66bQB8
         Gw1K4ASaiN6NJmHrD0vBPVd1QFA4GyWuRfzT2QGBb9K3p/pMMTL1PMCO3Y/A6aOcsCvB
         c6z9s7Jv5PVz3PXLau+ou+JQNsUwgdfcEjsa6QPK9DIJ980yvaclrLx0L/9gxINanu04
         5l8oDUyqrJbcKWwIySu9Yq3cBpoG2mSkl2IgpYI9Pei0TXBQMIvr7MHFrrxAr6RpDYOU
         CJOp2U8Ce40+rZMUV29x9UshfhvZaffo4Dx01tnEil+NGkJpZakIBXfllWpCGcfE/xsz
         4q0g==
X-Gm-Message-State: ACgBeo0qdN0j+2HQwRHz/gNW7pf0/Ptp5Foj1xNLIIMSlDzCOTVl0BBE
	3dfsCEaeTP2FokLvwemYcyZskzECJbn3MpwGkg+QHg==
X-Google-Smtp-Source: AA6agR4WMcZViHYZpEd/SVtNnppVJwpOi1ucgCxNEiA6EzB60zAGxFEFit4aqH2BPsbjzmfKyLISll05O9Er9BqpMHY=
X-Received: by 2002:a05:6000:1008:b0:225:58e0:223f with SMTP id
 a8-20020a056000100800b0022558e0223fmr187277wrx.375.1661529923505; Fri, 26 Aug
 2022 09:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220824153901.488576-1-irogers@google.com> <20220824153901.488576-12-irogers@google.com>
 <12acbe02-bd73-07bb-d0e1-cb13dcd790c0@intel.com>
In-Reply-To: <12acbe02-bd73-07bb-d0e1-cb13dcd790c0@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 26 Aug 2022 09:05:11 -0700
Message-ID: <CAP-5=fWCpoqAhLzdMn1zHXfKpsYg0LQPMSz6Uy82+QL_MQpc8g@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] perf dso: Update use of pthread mutex
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
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
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 26, 2022 at 3:37 AM Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 24/08/22 18:38, Ian Rogers wrote:
> > Switch to the use of mutex wrappers that provide better error checking.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/dso.c    | 12 ++++++------
>
> Some not done yet
>
> $ grep -i pthread_mut tools/perf/util/dso.c
> static pthread_mutex_t dso__data_open_lock = PTHREAD_MUTEX_INITIALIZER;
>         pthread_mutex_lock(&dso__data_open_lock);
>         pthread_mutex_unlock(&dso__data_open_lock);
>         if (pthread_mutex_lock(&dso__data_open_lock) < 0)
>                 pthread_mutex_unlock(&dso__data_open_lock);
>         pthread_mutex_unlock(&dso__data_open_lock);
>         pthread_mutex_lock(&dso__data_open_lock);
>         pthread_mutex_unlock(&dso__data_open_lock);
>         pthread_mutex_lock(&dso__data_open_lock);
>         pthread_mutex_unlock(&dso__data_open_lock);

Yes, these are all solely dso__data_open_lock that lacks any clear
init/exit code to place the initialization/destruction hooks onto. I
don't plan to alter these in this patch set.

Thanks,
Ian

>
> >  tools/perf/util/dso.h    |  4 ++--
> >  tools/perf/util/symbol.c |  4 ++--
> >  3 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> > index 5ac13958d1bd..a9789a955403 100644
> > --- a/tools/perf/util/dso.c
> > +++ b/tools/perf/util/dso.c
> > @@ -795,7 +795,7 @@ dso_cache__free(struct dso *dso)
> >       struct rb_root *root = &dso->data.cache;
> >       struct rb_node *next = rb_first(root);
> >
> > -     pthread_mutex_lock(&dso->lock);
> > +     mutex_lock(&dso->lock);
> >       while (next) {
> >               struct dso_cache *cache;
> >
> > @@ -804,7 +804,7 @@ dso_cache__free(struct dso *dso)
> >               rb_erase(&cache->rb_node, root);
> >               free(cache);
> >       }
> > -     pthread_mutex_unlock(&dso->lock);
> > +     mutex_unlock(&dso->lock);
> >  }
> >
> >  static struct dso_cache *__dso_cache__find(struct dso *dso, u64 offset)
> > @@ -841,7 +841,7 @@ dso_cache__insert(struct dso *dso, struct dso_cache *new)
> >       struct dso_cache *cache;
> >       u64 offset = new->offset;
> >
> > -     pthread_mutex_lock(&dso->lock);
> > +     mutex_lock(&dso->lock);
> >       while (*p != NULL) {
> >               u64 end;
> >
> > @@ -862,7 +862,7 @@ dso_cache__insert(struct dso *dso, struct dso_cache *new)
> >
> >       cache = NULL;
> >  out:
> > -     pthread_mutex_unlock(&dso->lock);
> > +     mutex_unlock(&dso->lock);
> >       return cache;
> >  }
> >
> > @@ -1297,7 +1297,7 @@ struct dso *dso__new_id(const char *name, struct dso_id *id)
> >               dso->root = NULL;
> >               INIT_LIST_HEAD(&dso->node);
> >               INIT_LIST_HEAD(&dso->data.open_entry);
> > -             pthread_mutex_init(&dso->lock, NULL);
> > +             mutex_init(&dso->lock);
> >               refcount_set(&dso->refcnt, 1);
> >       }
> >
> > @@ -1336,7 +1336,7 @@ void dso__delete(struct dso *dso)
> >       dso__free_a2l(dso);
> >       zfree(&dso->symsrc_filename);
> >       nsinfo__zput(dso->nsinfo);
> > -     pthread_mutex_destroy(&dso->lock);
> > +     mutex_destroy(&dso->lock);
> >       free(dso);
> >  }
> >
> > diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> > index 66981c7a9a18..58d94175e714 100644
> > --- a/tools/perf/util/dso.h
> > +++ b/tools/perf/util/dso.h
> > @@ -2,7 +2,6 @@
> >  #ifndef __PERF_DSO
> >  #define __PERF_DSO
> >
> > -#include <pthread.h>
> >  #include <linux/refcount.h>
> >  #include <linux/types.h>
> >  #include <linux/rbtree.h>
> > @@ -11,6 +10,7 @@
> >  #include <stdio.h>
> >  #include <linux/bitops.h>
> >  #include "build-id.h"
> > +#include "mutex.h"
> >
> >  struct machine;
> >  struct map;
> > @@ -145,7 +145,7 @@ struct dso_cache {
> >  struct auxtrace_cache;
> >
> >  struct dso {
> > -     pthread_mutex_t  lock;
> > +     struct mutex     lock;
> >       struct list_head node;
> >       struct rb_node   rb_node;       /* rbtree node sorted by long name */
> >       struct rb_root   *root;         /* root of rbtree that rb_node is in */
> > diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> > index a4b22caa7c24..656d9b4dd456 100644
> > --- a/tools/perf/util/symbol.c
> > +++ b/tools/perf/util/symbol.c
> > @@ -1800,7 +1800,7 @@ int dso__load(struct dso *dso, struct map *map)
> >       }
> >
> >       nsinfo__mountns_enter(dso->nsinfo, &nsc);
> > -     pthread_mutex_lock(&dso->lock);
> > +     mutex_lock(&dso->lock);
> >
> >       /* check again under the dso->lock */
> >       if (dso__loaded(dso)) {
> > @@ -1964,7 +1964,7 @@ int dso__load(struct dso *dso, struct map *map)
> >               ret = 0;
> >  out:
> >       dso__set_loaded(dso);
> > -     pthread_mutex_unlock(&dso->lock);
> > +     mutex_unlock(&dso->lock);
> >       nsinfo__mountns_exit(&nsc);
> >
> >       return ret;
>
