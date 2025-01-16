Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E811DE3B8;
	Thu, 16 Jan 2025 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025098; cv=none; b=RjkGGLw90H1n3Iw52les/bdgu7QgzlW0CNoi6NU9R/cun36gAs2PqgWJvOPgcdMT8Ar5BKK4r4Dm00fVwTS14T9iT9xRbjUJE7MjBmgXKPjcxAsbW01Tr3VU/NUqPx1KqQmp+qZ/MVJk1G7K4fwyYXUbdOeuRcOZbhP89aND8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025098; c=relaxed/simple;
	bh=u6aYsxJJTbT91yk1YQigzNcWXofSB06rd5l/tbFQ8vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQDrgkBN8AIYwTsLL77BXpb0jDY7v0FEqvAPH46Hvdf5MVEw7wmLyHUi2DuhooK04iVJaFTHs6UZ9CWhoYOxCd1wmz+/tf3gWG5pCD61NFQWBRkW65lhYe8y8ATESaPIK+0o9AGo8Nz1v5iDcC7NmOPavDD5XZi7NKFbN0xGZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV+wIXZx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV+wIXZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246A1C4CEDF;
	Thu, 16 Jan 2025 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737025097;
	bh=u6aYsxJJTbT91yk1YQigzNcWXofSB06rd5l/tbFQ8vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TV+wIXZx5xiw8gUYy6JUHBB5NEPc30MsFft64QN9ccc4dE0CwFkst4Vu4n0GRPC4T
	 2bJfgaqydqlmhJgjCBu9cu7/ymbrtU5383B4gera7RNj1dfQLZEqGFOE0dQHfayUOQ
	 kdfs+i86bOt4uoziQyQdAZu1PKYkfR3OzYGyHbGwTsTVG4pMGhMZNWbMNpPvle3tE+
	 LN56sIf2+J+ERj+rmcajaEy7OnmfgGHDslFfjp6hzfBt6e0xh+H5HjOrzxZJexa/ZR
	 BG4kzdYYubYYrEO0f38cm+R+kBzIW8IuzFhJPaXW1t3CGDQE1Ev4HE8tzxwbs6STS5
	 O9Bl77ctRx4Vg==
Date: Thu, 16 Jan 2025 11:58:12 +0100
From: Joel Granados <joel.granados@kernel.org>
To: yukaixiong <yukaixiong@huawei.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: Re: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error:
 static declaration of 'sysctl_nr_trim_pages' follows non-static declaration
Message-ID: <ivw43eqdebbz3w36yjxawb47jy2slopqxtw2b7jkthkaz4yih6@jos3xyo2s34h>
References: <202501150216.3RVz44uS-lkp@intel.com>
 <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
 <CANiq72n6jb62PzgP-3T6sBQRZCDb4Mi1wq6X8vEwRDT-2OvKrg@mail.gmail.com>
 <20250115142355.GA519100@ax162>
 <bd3d1c4d-a2e9-67ec-0106-4876853c86e1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd3d1c4d-a2e9-67ec-0106-4876853c86e1@huawei.com>

On Thu, Jan 16, 2025 at 10:05:27AM +0800, yukaixiong wrote:
> 
> 
> On 2025/1/15 22:23, Nathan Chancellor wrote:
> > On Wed, Jan 15, 2025 at 11:55:02AM +0100, Miguel Ojeda wrote:
> > > On Wed, Jan 15, 2025 at 9:14 AM yukaixiong <yukaixiong@huawei.com> wrote:
> > > >           I have deleted the line : "extern int sysctl_nr_trim_pages;" in
> > > > patch8 of v5. Why still produce this error? I don't understand!
> > > As far as I understand, the report is against the tree mentioned in
> > > the report, not against a patch series. So I would recommend checking
> > > the tree to see what it contains (e.g. what version).
> > This is the key. The version of the patch in the tree:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/commit/?id=0450345eca3ca45264db9ab09d31281e001236b7
> > 
> > is missing the hunk from include/linux/mm.h that was in the patch on the
> > mailing list:
> > 
> > https://lore.kernel.org/20250111070751.2588654-9-yukaixiong@huawei.com/
> > 
> > Was there a conflict at application time? Seems like this is something
> > Joel will likely need to sort out.
> > 
> > Cheers,
> > Nathan
> > .
> Right！Waiting for Joel's reply.
Should be OK now.



-- 

Joel Granados
