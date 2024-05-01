Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E70ED12EBCC
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714572211; cv=none; b=rV5a5HRjkWXj8I4B595/rsFzBbqd6Hr+jpuAyFZwnASlwqXH6jilT7CRaYFSHBN8zwsu5LC0pZ3hclvM/8uLEz/CDkkZZArFHdzFhmFAVHtfXCtArvdBZ1MxFM53Zt302ks0YApWxuOFO9vIc/PeKN/TM8VI05oPc14qJZAjYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714572211; c=relaxed/simple;
	bh=bVdH7wiDMxqebYJ+3rGDOc0SDGA5QMqyJo55xqWs9bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6QU5qKGvb/09bWl4aV3r7ZgQvnSqDqwGWfc6zyRO5dJa3ZIq9WJPmS+AO3o699QDHHejhIv5KWMrNeAn06quDDMzJOgcb2hNNdeLzQMNvkd/RG7f35K/1zzwLT9sh7q4F/XzXmMoeqCpmWvlTeaNBu/hdZ2lKuFk0CjZi5LziY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 692720 invoked by uid 1000); 1 May 2024 10:03:25 -0400
Date: Wed, 1 May 2024 10:03:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>,
  Norihiko Hama <Norihiko.Hama@alpsalpine.com>, llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 17/35] drivers/usb/storage/usb.c:141:21: error:
 incompatible pointer types passing 'unsigned int *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <3e2a7570-0704-4453-ad0b-68c5806157e5@rowland.harvard.edu>
References: <202405011431.PvaZHpRK-lkp@intel.com>
 <2024050141-remote-mockup-f933@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024050141-remote-mockup-f933@gregkh>

On Wed, May 01, 2024 at 08:50:36AM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 01, 2024 at 02:32:56PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   ac6a205c5bef39d65ecd9f5dd2c1d75652c35405
> > commit: 70d66b8e47e6fa031f541291e9dd3d7f0c44b41e [17/35] usb-storage: Optimize scan delay more precisely
> 
> I'm going to drop this commit from my tree now.
> 
> But really, it feels odd to have this parsing logic in a random driver
> for something like handling floating point numbers "properly" from
> userspace.  Why isn't this in the core kernel somewhere?  And, as that
> was a rhetorical question, the answer is we probably shouldn't be
> handling floating point number parsing in the kernel...

Strictly speaking, this is fixed point rather than floating point.  And 
the reason the commit didn't put the parsing code in the core kernel is 
because no other places seem to need it.  Still, I get your objection.

> I understand the quest for handling error time outs "faster" when you
> assume that you know that the error will never happen, but what's the
> odds that it will end up happening...
> 
> there has to be a better way to do this.

Norihiko, another possibility is to use ordinary integers but have 
users add an "m" or "ms" suffix when they want the value to be 
interpreted in milliseconds.  So "5" means 5 seconds, but "500ms" means 
500 milliseconds.

Alan Stern
