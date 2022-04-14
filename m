Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B83234
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 23:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1649979026;
	bh=TPcqwIRvfuDk2Qwm6BTs6G3vahsLIZFdldODm3sklMk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ZxPjQ+F7plFCcKdotqrCwi/s/FNlCDJMV1r0eQdm3t3Rlkgo7v45EfXAocRWrLcGd
	 4XTsJg5e9GuiburSyTtswK0SPWHEBnHkE1IB9HsabtrxOKocBLkEuNi03hKnMhEupb
	 tRwtJVcGaDHcU6hewfTKMD0a72M/xmsWdlqKWiFg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 57715128A06F;
	Thu, 14 Apr 2022 19:30:26 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpbvdN0xVR-D; Thu, 14 Apr 2022 19:30:26 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1649979026;
	bh=TPcqwIRvfuDk2Qwm6BTs6G3vahsLIZFdldODm3sklMk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=ZxPjQ+F7plFCcKdotqrCwi/s/FNlCDJMV1r0eQdm3t3Rlkgo7v45EfXAocRWrLcGd
	 4XTsJg5e9GuiburSyTtswK0SPWHEBnHkE1IB9HsabtrxOKocBLkEuNi03hKnMhEupb
	 tRwtJVcGaDHcU6hewfTKMD0a72M/xmsWdlqKWiFg=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:c551::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 9B7AA128A06D;
	Thu, 14 Apr 2022 19:30:25 -0400 (EDT)
Message-ID: <3119c35ba1fa7247e87d7acb56e85ea99092d0a4.camel@HansenPartnership.com>
Subject: Re: Plumbers conf presentation on -fanalyze?
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Nick Desaulniers <ndesaulniers@google.com>, David Malcolm
	 <dmalcolm@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux
	 <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Date: Thu, 14 Apr 2022 19:30:24 -0400
In-Reply-To: <CAKwvOdmXYa-A76CGitoAFNQz3rab37AJafQVN-=QSRVDA8y1fg@mail.gmail.com>
References: 
	<CAKwvOdnb-DiAnq4bT7XiJpFtqyJYpWNw1shEp8gWYpVmUpRBaA@mail.gmail.com>
	 <8c5012c88989a8f05a3b67540b9172336c57ddf7.camel@redhat.com>
	 <CAKwvOdmXYa-A76CGitoAFNQz3rab37AJafQVN-=QSRVDA8y1fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2022-04-14 at 15:13 -0700, Nick Desaulniers wrote:
> On Thu, Apr 14, 2022 at 3:08 PM David Malcolm <dmalcolm@redhat.com>
> wrote:
> > On Thu, 2022-04-14 at 14:42 -0700, Nick Desaulniers wrote:
> > > Hi David,
> > > Jose and I are currently in the planning process to put together
> > > a
> > > Kernel+Toolchain microconference track at Linux Plumbers
> > > Conference
> > > this year (Sept 12-14) in Dublin, Ireland.
> > > 
> > > We had seen
> > > https://developers.redhat.com/articles/2022/04/12/state-static-analysis-gcc-12-compiler#scaling_up_the_analyzer
> > > particularly the section on The Linux kernel and were wondering
> > > if
> > > you'd be interested in presenting more information about
> > > -fanalyze to
> > > kernel and toolchain developers there?
> > 
> > Thanks!  I'm very much interested, but am not yet sure about travel
> > (both in terms of (a) budget and (b) possible new virus
> > strains).  Is
> > this conference going to be purely in-person, or hybrid virtual/in-
> > person?
> 
> I didn't see an answer to that question on
> https://lpc.events/event/16/page/185-faqs.
> cc' James + Stephen who might be able to answer that more precisely
> than I could.

It's going to be hybrid ... I thought we actually managed to announce
that but forgot to put it on the front page.  However, there is a
caveat: to minimize the risk of technical issues, we'd very much like
the content producers (speakers etc) to be in person.  This won't be a
blanket requirement but we'll be unhappy if you try to have a MC with
mostly virtual speakers for instance.

Jaems


