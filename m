Received: from relay5.hostedemail.com (relay5.hostedemail.com [64.99.140.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA7C7C
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 04:03:44 +0000 (UTC)
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 608BC60B54;
	Fri,  4 Mar 2022 04:03:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id 478FA20033;
	Fri,  4 Mar 2022 04:03:32 +0000 (UTC)
Message-ID: <7368bc3ea6dece01004c3e0c194abb0d26d4932b.camel@perches.com>
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
From: Joe Perches <joe@perches.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Finn Thain
	 <fthain@linux-m68k.org>
Cc: Konrad Wilhelm Kleine <kkleine@redhat.com>, Tom Rix <trix@redhat.com>, 
 Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com,  shivasharan.srikanteshwara@broadcom.com,
 jejb@linux.ibm.com,  martin.petersen@oracle.com, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 megaraidlinux.pdl@broadcom.com, scsi <linux-scsi@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
In-Reply-To: <CANiq72kOJh_rGg6cT+S833HYqwHnZJzZss8v+kQDcgz_cZUfBQ@mail.gmail.com>
References: <20220127151945.1244439-1-trix@redhat.com>
	 <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
	 <0adde369-3fd7-3608-594c-d199cce3c936@redhat.com>
	 <e3ae392a16491b9ddeb1f0b2b74fdf05628b1996.camel@perches.com>
	 <46441b86-1d19-5eb4-0013-db1c63a9b0a5@redhat.com>
	 <8dd05afd-0bb9-c91b-6393-aff69f1363e1@redhat.com>
	 <233660d0-1dee-7d80-1581-2e6845bf7689@linux-m68k.org>
	 <CABRYuGk+1AGpvfkR7=LTCm+bN4kt55fwQnQXCjidSXWxuMWsiQ@mail.gmail.com>
	 <95f5be1d-f5f3-478-5ccb-76556a41de78@linux-m68k.org>
	 <CANiq72kOJh_rGg6cT+S833HYqwHnZJzZss8v+kQDcgz_cZUfBQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 03 Mar 2022 15:38:27 -0800
User-Agent: Evolution 3.40.4-1ubuntu2 
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 478FA20033
X-Spam-Status: No, score=1.52
X-Stat-Signature: yz18ifsua7kdmzp74w4prbz8mu3wc8q6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18oUcfg3lbyw2FPCUH8mnKyjJijBMjDisc=
X-HE-Tag: 1646366612-611934

On Fri, 2022-03-04 at 00:17 +0100, Miguel Ojeda wrote:
> On Thu, Mar 3, 2022 at 11:44 PM Finn Thain <fthain@linux-m68k.org> wrote:
> > 
> > Others might argue that they should always be changed from,
> > 
> > /*
> >  * this style
> >  * of multiline comment
> >  */
> > 
> > to
> > 
> > /* this style
> >  * of multiline comment
> >  */
> 
> In general, for things that the coding style guide talks about, we
> should follow them, even if some subsystems do not (they can always
> override in their folder if they really, really want it). So, here for
> instance, the first one should be used.

It's up to individual maintainers to each decide on what might be
considered unnecessary churn for the subsystems they control.

One argument is that churn leads to difficulty in backporting
fixes to older 'stable' versions.

I think the churn argument is overstated.


