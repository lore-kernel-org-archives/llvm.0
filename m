Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D1F7C;
	Wed, 30 Mar 2022 10:59:14 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 719CE59D;
	Wed, 30 Mar 2022 12:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1648637439;
	bh=AKINsQNNEHyPQ0zEyaooSfWvaeG9TlXPko12sWdzLgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AxU5nMJRaM5E7X35ks8ZJOfUWDpJNFAuajCO7zA5YB1w9RxwbHGByoFfTCvZxj26J
	 rtnP8cGizBbLyQbedCQ5hDQSDtK4MASRNJjk210Khy9njGOSHgWXxZscnzoy45iY7a
	 5roIr32ZMTWPTrgRkASDLKrR9GpxSn7mJhusEKnA=
Message-ID: <61fdb731-1ebb-941c-4bd7-7da8c31c8e74@ideasonboard.com>
Date: Wed, 30 Mar 2022 13:50:35 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: staging: atomisp: rework reading the id and
 revision values
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Tom Rix <trix@redhat.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
 ndesaulniers@google.com, hverkuil-cisco@xs4all.nl, vrzh@vrzh.net,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220326191853.2914552-1-trix@redhat.com>
 <YkN0w5NxLcBFes1b@paasikivi.fi.intel.com>
 <2ab474d8-ee4e-44b5-ab3c-38b72135a27f@redhat.com>
 <YkQx6jk5V2/f5mye@paasikivi.fi.intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YkQx6jk5V2/f5mye@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/03/2022 13:33, Sakari Ailus wrote:
> Hi Tom,
> 
> On Tue, Mar 29, 2022 at 04:21:20PM -0700, Tom Rix wrote:
>> I'll do a resend.
>>
>> I use git send-mail, sooo not sure what went wrong.
> 
> The resent patch also has the same Content-type. I looked a bit further and
> it seems that this is very probably added by our mail system somehow: it's
> not present on the patch I received through a different route. Weird.

Well... For me, the original patch in this thread was text/plain. But 
the [RESEND PATCH] was application/octet-stream, and Thunderbird shows 
it as empty body with an unnamed attachment.

  Tomi
