Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07C431E82B
	for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099291; cv=none; b=PDGzeyT4dhH9zhez0FzBenbHFFvvWUidwjQbMw3cQw0uOq2hKhb86IFyRypG8LoQR9d2MuQNe7vbOssta7rjGQXKB7lpYcn1DmnSPhbDYmaBY13v50grvfiiPfsc4lSPanj+zbRvJ0CTmR1OTQG1QlxRhPmzKSH98Sd1JjMYZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099291; c=relaxed/simple;
	bh=3Gtf831Pjh85bW7c537PCh1DrjFISMzw15k94wl+Cs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UrOKfr+py6Fq8vPxZk6582C02Zeev0ak70BSAQfcHjJo8f37IIMZve4fIauDczIsfWYzzO/wwcE7j6KTFI1GOKkvT7UD2XQ6lemwEQ5ecu1xdWk+fKWMgdT8WHhJl1sWafayQNsE0hRC9JV5H8pRt7ckA01ClEKoeEdF3WOL8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id C15ACC119C;
	Mon, 13 Apr 2026 16:54:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id DA9FA2002C;
	Mon, 13 Apr 2026 16:54:38 +0000 (UTC)
Message-ID: <b4e9f338b8cdc168f90848b8daf321386b863915.camel@perches.com>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
From: Joe Perches <joe@perches.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim	
 <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers	 <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Andrew Morton
 <akpm@linux-foundation.org>
Date: Mon, 13 Apr 2026 09:54:37 -0700
In-Reply-To: <CAP-5=fWteCfNQ7DmwLorcs9h3iH__XK01CrwnJ4-qUfcDCsSSA@mail.gmail.com>
References: <20260407165551.3075684-1-irogers@google.com>
	 <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
	 <CAP-5=fX92ncYELs_XQXw55A=PYxBnLY2V1CqSpCV71Zc9Pf3oA@mail.gmail.com>
	 <404f559a885169513b7e3526eeff77148ee55bb8.camel@perches.com>
	 <CAP-5=fWteCfNQ7DmwLorcs9h3iH__XK01CrwnJ4-qUfcDCsSSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: DA9FA2002C
X-Rspamd-Server: rspamout06
X-Stat-Signature: efozqsyw95ggqzttkugcacp8rkzna7j5
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18xsuZHevBVtU93EfTafSankFM2rfThBkg=
X-HE-Tag: 1776099278-331395
X-HE-Meta: U2FsdGVkX1/Srg1P3eqC4CD2XQcDQnZoEAI0Rta319azJyOpEpx4vojPHevqvNCBYGSn8JmPKE+yGCwPyExWZgAC+Zy0okoFHkUGUsMjASQRAOMtOcuqr/10nsX6BMuT6bG2on29L5sQLo/Vs+PjwM12JbzOS+NqqDGJUSl2OyvH+lhH1fvIL4wQC8PWt0CdJ8VzB6X5kPSLF04VnAhCHBaaiRSDrw0AhGNaTZYWVSN2zpCkfvRcsfns9FlidvDMQ7pJRDKEC52imqnbWEGyes3+0vDp4eCW5ZYAF7tUQbF16uGohp3MLz2Q3hmNEMH89gwu1jxuapOwip4n/Nv4GgfRqw8G+n0ZSIaPHs/R7Q1D/qsAuYNj00HF2Cwzk1Z9AhUYr522EdkslNwPhmHoC/gi+P6uYK3Qt2O7NTgTSUEm1rUdm8nyd+jPWS+Xf89rAi+SMeLm4GM=

On Mon, 2026-04-13 at 09:19 -0700, Ian Rogers wrote:
> On Mon, Apr 13, 2026 at 8:45=E2=80=AFAM Joe Perches <[joe@perches.com](ma=
ilto:joe@perches.com)> wrote:
> > On Mon, 2026-04-13 at 08:39 -0700, Ian Rogers wrote:
> On Tue, Apr 7, 2026 at 10:11=E2=80=AFAM Joe Perches <[[joe@perches.com](m=
ailto:joe@perches.com)](mailto:[joe@perches.com](mailto:joe@perches.com))> =
wrote:
> On Tue, 2026-04-07 at 09:55 -0700, Ian Rogers wrote:
> > > Sorting headers is desirable to avoid issues like duplicate includes.
> > > > Perhaps.
> > > > Some others prefer reverse-christmas-tree by length ordering for #i=
ncludes
> > > > though I think it's poor style.
> > > Thanks Joe. I second not switching to a reverse-christmas-tree style =
:-)
> > > If this patch is okay, could we bring it in through the perf tree?
> > It's likely better to avoid this suggestion.
> > The issue is that others strongly prefer that reverse-christmas-tree
> > style and would object so nak.
> Presumably that is a kernel suggestion rather than a tools directory
> suggestion. We can move the file into tools/perf, tools/lib/perf, etc.
> if that removes more global concerns. perf hasn't adopted a
> reverse-christmas-tree style.

Fine by me.
Just curious: is this a style control file used by directory depth/path?
