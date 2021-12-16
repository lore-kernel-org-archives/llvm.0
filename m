Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A72CA4
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 00:18:54 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 13so35720252ljj.11
        for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 16:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+VIjZtVSPWT2gGgiRuvRCU5VTC451kUMt9Vg28Xc/sc=;
        b=UWk1PS8WwrhC0Bg7kG1Ewtr+tsmt3aGt2jgAn1YIwZBxjM937t+9H2SlyBJ6VHMF5p
         Ta3fOF2q/R/4KD7nnTo4PfccUvHnAg4YN3UiqPUEF2MId9FXvujMGsviVvMI9/EIBI4N
         YMuugrKrhqYJEnhFyvUNCuOXJ34bvh2qhDtn8hxDbFPdZ7ZEeO0cy1RMCv406JD2F8ib
         vlyOi+cxmQQp6RrvxJQkhwalVQMg15S7kQgXTkClxq08pw55qBLXsW88xX0YH4rCmuvi
         xFjEYI6DrFHg460WXYloTNLugYfO6dom7vtftECeaYR81+I6vdu2ASRXF4I2Qflx5g1d
         mxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+VIjZtVSPWT2gGgiRuvRCU5VTC451kUMt9Vg28Xc/sc=;
        b=ck3WCCgkO/M4V2tx6O1fxybrB9/8TbhCI7guKxAXIxFk3/MNkzFAUgZ3pSIoiVym6E
         xhhI1rqblbql/M++kJr5368fsRlRA/WEp7fQa6Y7sjpm1jF2Lw8vEiTeD6dO/0WBR3qn
         Qk4sYBbJfIElEcJG2yx5wAn/uhRgAhKt3X8JsPqoRPhRKIxQDe2nby1RsBmzDFw5dfp8
         MmzGH2pMi/6NavUvwqN68tkv8f29K2cwArtJ3CHoMzWA/ZPiP1LePPnlvM7u7zU1ZLEn
         aslTw5sh7fRr04HsHq6xJThZM2tz324eXrBsCMzTo0rZLLRKas/H+goTG2B4K4nO9sXX
         zWsg==
X-Gm-Message-State: AOAM533yigwfnbVkLaOW0qpvT6ZjKLEXoAAD8f2XJCcgjn2l8VWnkq9/
	126lHxEBbfBaNmg1fB1N25AjUC1JjTAcODBeVRthGg==
X-Google-Smtp-Source: ABdhPJzaI6L+idDr3TbmF48cImCaj4grF+k8hOTubQ1RmOwZ3USkgXJz/1sA+bxEB2oWtSTD7FNqiGbvM/bAGtLB/RU=
X-Received: by 2002:a2e:9a8c:: with SMTP id p12mr12722731lji.526.1639613932250;
 Wed, 15 Dec 2021 16:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <157245708.33559.1639605989199.JavaMail.zimbra@efficios.com> <CAKwvOdkUhqt8eUQ_3HknXkF=6LBFY6Zc7rsXFPCT3GwNfmDoUQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkUhqt8eUQ_3HknXkF=6LBFY6Zc7rsXFPCT3GwNfmDoUQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 15 Dec 2021 16:18:40 -0800
Message-ID: <CAKwvOdmxOsEFkEGuh86F5CZ9sgqq8G9di9ryVUEeTQCjfoETqA@mail.gmail.com>
Subject: Re: clang asm goto issue small reproducer
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, James Y Knight <jyknight@google.com>, 
	Eli Friedman <efriedma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 15, 2021 at 3:50 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Dec 15, 2021 at 2:06 PM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
> >
> > Hi Nick,
> >
> > I have a small reproducer for the asm goto issue we discussed over irc. I have
> > axed away all code that is not the problematic function by hand. Hopefully this
> > won't change the overall optimization context too much.
>
> If I cut the compilation pipeline off at after "middle-end"
> optimizations, I can see that `this_cpu_list_pop` returns `NULL` for
> test.c while in test-asm.c, it's a phi node of either NULL or head
> (which looks correct; for the test-asm.c case).
>
> "GVNPass" seems to be converting
>
> return:                                           ; preds =
> %cleanup.thread19, %cleanup.thread
>   %retval.118 = phi %struct.percpu_list_node* [ %9, %cleanup.thread ],
> [ null, %cleanup.thread19 ]
>   ret %struct.percpu_list_node* %retval.118
>
> into:
>
> return:                                           ; preds =
> %cleanup.thread19, %cleanup.thread
>   ret %struct.percpu_list_node* null
>
> Which drops the
>   %9 = load %struct.percpu_list_node*, %struct.percpu_list_node**
> %head, align 8, !tbaa !9

Ah, Eli pointed out that I'm chasing the wrong squirrel. From test.c we have:

struct percpu_list_node *head;
load = (intptr_t *)&head;
ret = rseq_cmpnev_storeoffp_load(targetptr, expectnot,
     offset, load, cpu);

then in rseq_cmpnev_storeoffp_load():
__asm__ __volatile__ goto (
  :
  :
[load] "m" (*load));

Did we ever initialize head?  Isn't this equivalent to:

int* foo (void) {
  int *head;
  int **load;
  load = &head;
  asm(""::"m"(*load):"memory");
  return head;
}

Isn't that equivalent to:

int* foo (void) {
  int *head;
  asm(""::"m"(head):"memory");
  return head;
}

For which neither compiler warns for -Wuninitialized? They would if
head was an argument to a function call...

>
> I think GVN may be eliminating a phi that it should not be.
> Specifically, it seems that GVN thinks the default/fallthrough
> successor is unreachable, which seems incorrect to me. The predecessor
> lists all look correct to me, so GVN may be stumbling on callbr
> itself.
>
> $ clang -O2 test.c -emit-llvm -S -o - -Xclang -disable-llvm-passes > test.ll
> $ opt -O2 -print-before=gvn -print-after=gvn
> -filter-print-funcs=this_cpu_list_pop test.ll -o /dev/null 2>
> test.gvn.ll
>
> Then using this reproducer, I was able to narrow it down a little further:
>
> $ opt -O2 -print-before=gvn -print-module-scope
> --filter-print-funcs=this_cpu_list_pop test.ll -S 2>test.pre-gvn.ll
> $ llvm-extract --func=this_cpu_list_pop test.pre-gvn.ll -o
> test.pre-gvn.this_cpu_list_pop.bc --recursive
> $ llvm-dis test.pre-gvn.this_cpu_list_pop.bc
> $ cat repro.sh
> #!/usr/bin/env sh
> set -e
> grep -q "%retval.118 = phi %struct.percpu_list_node\* \[ %9,
> %cleanup.thread \], \[ null, %cleanup.thread19 \]" $1
> grep -q "ret %struct.percpu_list_node\* %retval.118" $1
> OUT=$(opt -passes=gvn $1 -S -o -)
> echo $OUT | grep -q "ret %struct.percpu_list_node\* null"
> $ llvm-reduce --test=./repro.sh test.pre-gvn.this_cpu_list_pop.ll
>
> Then pared down further manually, see reduced.ll
>
> I've filed https://github.com/llvm/llvm-project/issues/52735, let's
> discuss more there?
>
> >
> > on x86-64:
> >
> > Buggy code:
> > clang-13 -O2 -o test.o test.c
> >
> > OK code (added a dummy asm("")):
> > clang-13 -O2 -o test-asm.o test-asm.c
> >
> > Thanks,
> >
> > Mathieu
> >
> > --
> > Mathieu Desnoyers
> > EfficiOS Inc.
> > http://www.efficios.com
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--
Thanks,
~Nick Desaulniers
