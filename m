Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469CE1851
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 17:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E19C385A4;
	Fri, 29 Apr 2022 17:59:18 +0000 (UTC)
Date: Fri, 29 Apr 2022 13:59:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, Michael Ellerman <mpe@ellerman.id.au>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 2/2] ftrace: recordmcount: Handle sections with no
 non-weak symbols
Message-ID: <20220429135916.47c3e623@gandalf.local.home>
In-Reply-To: <1651252324.js9790ngjg.naveen@linux.ibm.com>
References: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
	<126aca34935cf1c7168e17970c706e36577094e7.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
	<20220428184212.18fbf438@gandalf.local.home>
	<1651252324.js9790ngjg.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 Apr 2022 23:09:19 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> If I'm understanding your suggestion right:
> - we now create a new section in each object file: __mcount_loc_weak, 
>   and capture such relocations using weak symbols there.

Yes, but it would be putting the same information it puts into __mcount_loc
but also add it here too. That is, it will duplicate the data.

> - we then ask the linker to put these separately between, say, 
>   __start_mcount_loc_weak and __stop_mcount_loc_weak

Yes, but it will also go in the location between __start_mcount_loc and
__stop_mcount_loc.

> - on ftrace init, we go through entries in this range, but discard those 
>   that belong to functions that also have an entry between 
>   __start_mcount_loc and __stop_mcount loc.

But we should be able to know if it was overridden or not, by seeing if
there's another function that was called. Or at least, we can validate them
to make sure that they are correct.

> 
> The primary issue I see here is that the mcount locations within the new 
> weak section will end up being offsets from a different function in 
> vmlinux, since the linker does not create a symbol for the weak 
> functions that were over-ridden.

The point of this section is to know which functions in __mcount_loc may
have been overridden, as they would be found in the __mcount_loc_weak
section. And then we can do something "special" to them.

> 
> As an example, in the issue described in this patch set, if powerpc 
> starts over-riding kexec_arch_apply_relocations(), then the current weak 
> implementation in kexec_file.o gets carried over to the final vmlinux, 
> but the instructions will instead appear under the previous function in 
> kexec_file.o: crash_prepare_elf64_headers(). This function may or may 
> not be traced to begin with, so we won't be able to figure out if this 
> is valid or not.

If it was overridden, then there would be two entries for function that
overrides the weak function in the __mcount_loc section, right? One for the
new function, and one that was overridden. Of course this could be more
complex if the new function had been marked notrace.

I was thinking of doing this just so that we know what functions are weak
and perhaps need extra processing.

Another issue with weak functions and ftrace just came up here:

  https://lore.kernel.org/all/20220428095803.66c17c32@gandalf.local.home/


-- Steve
