Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7103B635C
	for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095485; cv=none; b=VqlaP064OJpm2IGq+zXlkt72XQBMq9WQBwawhFq9c8bBtjoE7zNCwToMovuWmaRj5ur+FbfkYPQf0J9mdRt7whIiP67yRYyc+Yq/l9JbNUElOs9S/MgqCfeyXzOLf66WC5uuYEIhvTb6B5vzFF2IqnsYFzOObg3E3RPUQoG9uHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095485; c=relaxed/simple;
	bh=BVouf3ftIQ9uhpg+6JRAQFKCTGNhh0y5CS3xkwIjVI8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cIvLdkDZ2IxzT+BYAKj+AMs7NLQW46YqfvRfT8Ti9XvqB3FzorvKwRmlNuI1BHXwyFQUIUspwcoHiF0YoAcv67wrKJI6SLWdK1R8ne6NqyRal5JAuKVcvzhUlA0KdddL+a9uIvb8U5ecC2Ad4Nqfdxucq8X8/gADCHt6HGYCNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 8590A1A01D4;
	Mon, 13 Apr 2026 15:45:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id C4D0920028;
	Mon, 13 Apr 2026 15:45:25 +0000 (UTC)
Message-ID: <404f559a885169513b7e3526eeff77148ee55bb8.camel@perches.com>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
From: Joe Perches <joe@perches.com>
To: Ian Rogers <irogers@google.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>,  Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 13 Apr 2026 08:45:24 -0700
In-Reply-To: <CAP-5=fX92ncYELs_XQXw55A=PYxBnLY2V1CqSpCV71Zc9Pf3oA@mail.gmail.com>
References: <20260407165551.3075684-1-irogers@google.com>
		 <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
	 <CAP-5=fX92ncYELs_XQXw55A=PYxBnLY2V1CqSpCV71Zc9Pf3oA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: C4D0920028
X-Stat-Signature: w9myiikzpcrwnqd4qks8t1km8f5c9sr7
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19K2u6Jzu4Dr9XAtl+KfokRojGN6tUV+Po=
X-HE-Tag: 1776095125-7956
X-HE-Meta: U2FsdGVkX1/F2rsBHeahsNgnyjckRgzkDPRap/1ZXzlZc8ZwlouxPP0Wdy3CWPwDZfIOC8nSpqNe0ehFtRozs7iJUq2bP5xywwFno2ZIuSzVBiqysu5FVEqdIqcsLyQ1sEIi3FjWsyNCgT3l82aFi0E5Ir0wv6984ELmgVfiVoPFCFM1co8Cs1Ep6H9YwEO26Zn+O0vIgJoQ92NFh9zqGKzbP+D1ebRWW8riec+BSDRCrKy7qiwngI3nY+LEXFBXMJdR6IpyiiaotR87lq7XohGks8wslyBiZUwUOoHkOoqJUR0h2+AJI6I1tgcvmFY7LJGhZlh+Dm90EyXYYDSbOOS+91VMoJxUpGr2y7wdReT/9rbEL4kFkuT2yoKgqbf9MeaWGUnPitiusJRXjM4BLhr2XVqz6GXXcPgOHO3ogcbaWKjeDSryRpIzSWGgLmMo

On Mon, 2026-04-13 at 08:39 -0700, Ian Rogers wrote:
> On Tue, Apr 7, 2026 at 10:11=E2=80=AFAM Joe Perches <[joe@perches.com](ma=
ilto:joe@perches.com)> wrote:
> > On Tue, 2026-04-07 at 09:55 -0700, Ian Rogers wrote:
> Sorting headers is desirable to avoid issues like duplicate includes.
> > Perhaps.
> >=20
> > Some others prefer reverse-christmas-tree by length ordering for #inclu=
des
> > though I think it's poor style.
>=20
> Thanks Joe. I second not switching to a reverse-christmas-tree style :-)
>=20
> If this patch is okay, could we bring it in through the perf tree?

It's likely better to avoid this suggestion.

The issue is that others strongly prefer that reverse-christmas-tree
style and would object so nak.
