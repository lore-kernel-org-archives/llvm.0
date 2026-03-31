Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C81A3154;
	Tue, 31 Mar 2026 03:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929247; cv=none; b=qEd1pHxmwqs6YxC1/Y0EqOtLyvmRXXBY2HH7w+PucmGs31y+LxY/G5BU6d31m+zNTVYZ66qgPOcutO1PzUn0wG6CcBCw8XLZsCv3jbucid1hTxbHo43UFfuj3tiTq6rzzCOEhbZowLLXOh2Gxpv5bHqmcLCgSewv1LbJHN/nMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929247; c=relaxed/simple;
	bh=1zKueCjYPnMUW760AR6slevZskmLyUpa7pjvFUk5AWI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pcCu3+XHIgnk2jEZBf36bXP4EwDSpvvuaaaiks/wsbaa3Y8+68pKws1rnQtijiIOfBwuSQ/XmJ/yOJDvTilW3vMtHmZM9B9P+HcKygcl5tOM75o+4g4QX64uUj/WWEfdxXonmu4RfmNTJOWEObvP9FaRBjVdPp78Iz5iDXVaSQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=v969ObtV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="v969ObtV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1A8C19423;
	Tue, 31 Mar 2026 03:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774929246;
	bh=1zKueCjYPnMUW760AR6slevZskmLyUpa7pjvFUk5AWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=v969ObtVceDu/y5QHcMcwGQ58QnhHdCUH7gc4zKcwrmwyvkeQZ5sbjun9BpPa+lSB
	 j0fGOKuB1ZPTL2wmhlSQmz3XXeHalmeni8/LvVzICod+FXrVLF2suSaMTldjwKSSHe
	 pJVqFm8ONtL0XAoLDyYwM4CNJLSH0YJGh/QpNUko=
Date: Mon, 30 Mar 2026 20:54:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: linux-mm@kvack.org, "David Hildenbrand (Red Hat)" <david@kernel.org>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/2] mm: Convert vmemmap_p?d_populate() to static
 functions
Message-Id: <20260330205405.44d128cac32b971ec9134c70@linux-foundation.org>
In-Reply-To: <CAAWJmAaOL_NUtJZfHguSdPUsNVCSU0U=GWnTeVAKhnGgwSKeEg@mail.gmail.com>
References: <20260201063532.44807-1-pilgrimtao@gmail.com>
	<20260201063532.44807-3-pilgrimtao@gmail.com>
	<CAAWJmAaOL_NUtJZfHguSdPUsNVCSU0U=GWnTeVAKhnGgwSKeEg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 31 Mar 2026 11:16:33 +0800 Chengkaitao <pilgrimtao@gmail.com> wrote:

> Hi Andrew Morton，
> 
> I noticed this patch was dropped; the failure report is here:
> https://lore.kernel.org/all/202603251338.grra8xt7-lkp@intel.com/#R
>
> Could this be a false positive? The series has two patches: the first
> one already removed references to vmemmap_p?d_populate() on sparc; see:
> https://lore.kernel.org/all/20260201063532.44807-3-pilgrimtao@gmail.com/T/#mefaa36aeff173d08f0508cd44be46e830c067fe9
> 
> Might the build error be because only the second patch was applied,
> without the first?

There was some confusion over a later patch which was there to fix an
earlier patch, only the earlier patch was dropped!

Sorry 'bout that.  Can you please resend the patch after -rc1 and we'll
try again.

