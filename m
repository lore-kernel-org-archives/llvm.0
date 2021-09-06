Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DF272
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630952853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zdZg7k52Zmj/hALie/T8LIPyy9j0vAZZQI7YDqk+68Q=;
	b=LocQZ6z1rcdHMKNmhVoHRP8JTMlDB8HfPZVlcNskuc6uYuaTAQJRHipi8lS6VqUL7nb7wn
	qSjdTUdpctt63wD+5M2t2DNPKmIahprGAKpIb7ntoRo2+ZSGHLplvoolQ554wBnq0inQO/
	+T7Ee0f1lJ+vwJbGdxed4oBnk1AIeZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-8aTRbxFEMw2lx2hBnSYCSQ-1; Mon, 06 Sep 2021 14:27:32 -0400
X-MC-Unique: 8aTRbxFEMw2lx2hBnSYCSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59C0C1883520;
	Mon,  6 Sep 2021 18:27:30 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.195.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A66C25C22B;
	Mon,  6 Sep 2021 18:27:27 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,  Nathan Chancellor
 <nathan@kernel.org>,  Masahiro Yamada <masahiroy@kernel.org>,  Nick
 Desaulniers <ndesaulniers@google.com>,  Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  clang-built-linux
 <clang-built-linux@googlegroups.com>,  llvm@lists.linux.dev,
  linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
References: <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
	<3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org>
	<878s0c4vng.fsf@oldenburg.str.redhat.com>
	<20210904131911.GP1583@gate.crashing.org>
	<871r644bd2.fsf@oldenburg.str.redhat.com>
	<CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
	<20210904191531.GS1583@gate.crashing.org>
	<CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
	<20210906154642.GV1583@gate.crashing.org>
	<CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
	<20210906172701.GX1583@gate.crashing.org>
	<CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
Date: Mon, 06 Sep 2021 20:27:25 +0200
In-Reply-To: <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
	(Linus Torvalds's message of "Mon, 6 Sep 2021 11:11:35 -0700")
Message-ID: <87lf49wodu.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

* Linus Torvalds:

> We use the compiler intrinsics without the C library header files for
> everything else, so doing so for <stdarg.h> seems to actually be a
> clarification and improvement.

This is an exaggeration.  On several architectures, the kernel cannot
use the vector built-ins directly.  Some of the implementing headers are
very special and intertwined with the compiler.  <stdarg.h> is currently
not such a case, but it's just not technically not feasible to avoid
dependencies on all compiler headers.  I think this considerably weakens
the case against <stdarg.h> because the compiler version is so obviously
harmless.

What the kernel is doing here is imposing an unnecesary constraint on
compiler development.  Basically, you are telling compiler writers that
implementing features with the help of header files is a bad idea
because it makes it more difficult to use them from the kernel.  (See
the proposed exceptions for vector code.)

Thanks,
Florian

