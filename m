Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C3ED4
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650365217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yxcu5ys80sCInub3Ls6SKzWV5PF7R9p2WfloWLeuP3g=;
	b=g1WUCGgLn0bsJsjNKPynZ3ibq54Cj7dgiYVhVezI6U1zBbdW+dtuaHh2NI+UG8+IKWTf73
	KqF7Hnn2zYMtcFEaSj3oDABSlTU8nNDvBIEcpL7kKt+NE+JyXIgbBvA2vLPnBRthpWjbHr
	uF6rcqIEF+x5GFFKqUP33SP7duaOEDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-6rTzjl52ORuwoIN_FxXKgw-1; Tue, 19 Apr 2022 06:46:53 -0400
X-MC-Unique: 6rTzjl52ORuwoIN_FxXKgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B8B28EF6C1;
	Tue, 19 Apr 2022 10:46:52 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.187])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40C9F4104961;
	Tue, 19 Apr 2022 10:46:50 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Jose E. Marchesi" <jemarch@gnu.org>,
 linux-toolchains@vger.kernel.org,
 clang-built-linux <llvm@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Carlos O'Donell <carlos@redhat.com>
Subject: Re: plumbers session on syscall wrapping and kernel header libc
 circular depdence?
References: <CAKwvOdmwyFDYKMpq0dcvbq06drtZonpNJ3PqLx2RMBE00beHZA@mail.gmail.com>
Date: Tue, 19 Apr 2022 12:46:48 +0200
In-Reply-To: <CAKwvOdmwyFDYKMpq0dcvbq06drtZonpNJ3PqLx2RMBE00beHZA@mail.gmail.com>
	(Nick Desaulniers's message of "Fri, 15 Apr 2022 10:48:13 -0700")
Message-ID: <87lew14ag7.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1

* Nick Desaulniers:

> Hi Florian, Arnd, and Masahiro,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.

I'm not sure if I will be able to travel by that time.

> Would you all be interested in a session (if you're planning on
> attending) discussing syscall wrapping for libc's and UAPI circular
> dependency on the libc?
>
> Masahiro and I were recently discussing the feasibility of building
> the kernel UAPI header tests with -nostdinc, but there are some
> interesting complications perhaps worth sharing with others?

To be honest, that doesn't seem to be a good use of a session slot.
Surely we can figure out a way to solve this issue offline (and if it's
a problem worth solving)?

(I expect that using -nostdinc makes it more difficult to support
compilers which are not GCC-compatible.)

Thanks,
Florian

