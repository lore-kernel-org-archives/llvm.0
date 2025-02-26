Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F51238D34;
	Wed, 26 Feb 2025 20:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740601882; cv=none; b=u3a5GdbxDiAYsz3DXlXN+IOXLpnU2UuH6rLa30bptywP8cLtDE3uAUweWXXyK0EtEMNxCDqgeTwRBNq9/oQrjsf5Ur/kTX0KPBL0fpwR6CjrNehLtU9O5gqfHYv4wKCd4/Z0gcq1tQJN3c0ebJZ+bFmiQ7137jFhmgC9RtT/voA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740601882; c=relaxed/simple;
	bh=RAbuoXYPpmrnMks9N3pxYV6F3ohXfRXUBzabXxlTH0Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eBFHJdAG6n67TzXnLLiBxUeY0ucMNKySf6NUrr7DVYC8t5tqlkSyxUFdBoEA8Cb7BApnK/3viULov6KRDveTdoYzr22kAt6mG+B3szAlL1eLz/0pY30sQ8efMWTld4RY/4KSPFINd08J+wzVZQZk+fLK7e93qngwxBv3Zt1Ugqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=x0ryAPcH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="x0ryAPcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EAFC4CEE7;
	Wed, 26 Feb 2025 20:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1740601881;
	bh=RAbuoXYPpmrnMks9N3pxYV6F3ohXfRXUBzabXxlTH0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=x0ryAPcHpupE8ubA0OBX4SesVJFdPurl+ucslP35eEseLhSREtmdpFua5QA62m1Fy
	 jYkMdKC+jOFl+BfO67ZbIhNh6XVMznza35fui3FWO80LrE5f6xCweTHtFFRGFQvPBj
	 GFSykfU4jQLw1PAGJ4YQJLDB1sRaM91p09YZ9MfA=
Date: Wed, 26 Feb 2025 12:31:21 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5933/6583] include/linux/page_ext.h:131:20:
 error: call to undeclared function 'page_to_section'; ISO C99 and later do
 not support implicit function declarations
Message-Id: <20250226123121.e316cfde42712338d70c9701@linux-foundation.org>
In-Reply-To: <8cece92a-6ad0-43fe-9916-eeb850c039e1@redhat.com>
References: <202502261733.Ma0eUGKJ-lkp@intel.com>
	<e5aec89c-a7d5-453a-8883-e3c025db2e5b@app.fastmail.com>
	<8cece92a-6ad0-43fe-9916-eeb850c039e1@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 09:24:11 -0500 Luiz Capitulino <luizcap@redhat.com> wrote:

> Andrew, I think you'll have to drop this for now. I may not
> have the time to look into this this week.

Done, thanks.
