Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29BE7F4
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 10:26:10 +0000 (UTC)
Received: from fencepost.gnu.org ([2001:470:142:3::e]:34274)
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <jemarch@gnu.org>)
	id 1ntRjc-00069F-De; Tue, 24 May 2022 06:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:In-Reply-To:Date:References:Subject:To:
	From; bh=gmPY7pu0idGDizRPRNasvnzdbh84qnnW6k/eb1e/WnY=; b=e6aedkZpvvmOHf0wOLry
	KUV35G4qZM402+I0hZM9c/agp49pS7S4hM/1ZE7TNYysLLBB/ufkOSUHprJz4dmP+QgyXow4o2vFA
	7gzHS+vDfURA6QBsi4gqoOQmvmZ5iE6xs2TB8IXNhrkeBS46L+8R8+RRwW0XN0MihIbwzj1R92IdN
	5KmmQPIMgeLsEh6AGw+pb7mSa54YFzgJFmectaL1SwFVZpHUS13IW516ABqqdm1ohe7fWr2LmYzAk
	lggf65DTsQgqEIMYRd6D/A/eOKSJFT/gUxqwyJ7phsX1Oq/D1t3wZEoB4fz88BEwLTIzoGnnUiibj
	FBkQZZ/llaKr6w==;
Received: from dynamic-077-185-012-078.77.185.pool.telefonica.de ([77.185.12.78]:48116 helo=termi.gnu.org)
	by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <jemarch@gnu.org>)
	id 1ntRjE-0003DS-8v; Tue, 24 May 2022 06:25:37 -0400
From: "Jose E. Marchesi" <jemarch@gnu.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,  Bill Wendling
 <morbo@google.com>,  vladimir.mezentsev@oracle.com,  clang-built-linux
 <llvm@lists.linux.dev>,  LKML <linux-kernel@vger.kernel.org>,  Yonghong
 Song <yhs@fb.com>,  Wenlei He <wenlei@fb.com>,  Hongtao Yu <hoy@fb.com>,
  Ingo Molnar <mingo@kernel.org>, Ruud van der Pas
 <ruud.vanderpas@oracle.com>
Subject: Re: plumbers session on profiling?
References: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
	<CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
Date: Tue, 24 May 2022 12:24:22 +0200
In-Reply-To: <CAKwvOdnsZekEM77axBf67MDqQVP0n6PTKH=njSyPSWTNiWAOiA@mail.gmail.com>
	(Nick Desaulniers's message of "Fri, 15 Apr 2022 13:41:42 -0700")
Message-ID: <87mtf7z0rt.fsf@gnu.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


I am adding Ruud van der Pas in CC.  He works in gprofng and would be
willing to participate in a discussion on kernel profiling.

> (Re-sending with Vladamir's email addr fixed; sorry for the noise)
>
> On Fri, Apr 15, 2022 at 10:54 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> Hi Sami, Bill, Jose, and Vladamir,
>> Jose and I are currently in the planning process to put together a
>> Kernel+Toolchain microconference track at Linux Plumbers Conference
>> this year (Sept 12-14) in Dublin, Ireland.
>>
>> Would you all be interested in leading a session discussing various
>> profiling related topics such as:
>> * gprofng
>> * PGO
>> * AutoFDO
>>
>> Would others find such a discussion useful?
>> --
>> Thanks,
>> ~Nick Desaulniers
