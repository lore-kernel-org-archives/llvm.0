Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A26320326
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 21:46:37 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27761d85b31so159970a91.3
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696283197; x=1696887997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y86AWWtsD8deWIYd/tc86/npyfYKbgsHuTwpWzSR7k8=;
        b=2FQNCwn6l1Li3IaAAQglxPrbogiF4zIIyeos3O/FYtngpEz2ZOt+DzrmLCZgvhYCsZ
         r3IalSBiiWGTHfABgCJYh8i3jj+XNdtwBOw9b1jm6xfJOUjc2lgPfDhqk9EB4AFQWTj3
         GCAZ6jNttmc2EcOjkQRUIjo+YYH9cJIunSH2Z/Alaeoxntn6DMEM8uH9ooQ9mDWmxu+U
         z92Z3LFpSm3bT5LZkES2UVKzbRpD9hnjtWC08PDaIAezCEYRNLyOxMwdrWBHmXUgHQqB
         0KGtQsUQTbjKBS6GIeX/RWUYH7lSpQIEA/7t+YVikvv3KLm0iYnFPNt8jzbN8K765OTn
         wQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696283197; x=1696887997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y86AWWtsD8deWIYd/tc86/npyfYKbgsHuTwpWzSR7k8=;
        b=HmHd90Vy1HFi1+R4ZWGhV6B4SkX/Y/zfZ99/ObkcK0/odn2cu+I7objPmkfcuHCQ8Y
         myi4/5M5lUhwkSQqsDRXVbiP8BSACbey9EuCmQBNvds1Jr5FjMDuU7RVGGGLTaPDOKDb
         37ZHAQCOlfwkNS2PxMPdmghsr055RcXIB1zOvdXou78+6X6CRzG63ncdT9hz/ZYQRuVJ
         4i/TAocuYtSR+QmMKojKqMGUhsjDxZ34cxbsTJXBN24kwwcjlgdBnZ51839Fv8VfYInO
         98CdZoDGgLsyJEG/8b9Wt1KZt2iDU35cW+qhXmJDOPt9fCERXudzZLMADERQXwQ8c88s
         sgPg==
X-Gm-Message-State: AOJu0YzAAtxbD0jKqgoeOx1M2XCxsKGg9wDJ7k9YPQiAn6bRNGAshPGk
	PNsgQtkhcpCMbaZL9Ti6IYf28rcy72xpYCg0qZzuzw==
X-Google-Smtp-Source: AGHT+IHrxazDYrCjdNrlY+7cwdza88XWMhkayyfug7tp5B15h5gGKmsYqWOmgmzjLPoFA/MAXmKxT7vXgqmEokhFS0o=
X-Received: by 2002:a17:90a:3884:b0:26b:49de:13bd with SMTP id
 x4-20020a17090a388400b0026b49de13bdmr9890126pjb.36.1696283197079; Mon, 02 Oct
 2023 14:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230912002703.3924521-1-acdunlap@google.com> <20230912002703.3924521-3-acdunlap@google.com>
 <20231002200426.GA4127272@dev-arch.thelio-3990X> <8c99f8d2-247d-ccee-3a0b-e95e547f8b9b@intel.com>
In-Reply-To: <8c99f8d2-247d-ccee-3a0b-e95e547f8b9b@intel.com>
From: Adam Dunlap <acdunlap@google.com>
Date: Mon, 2 Oct 2023 14:46:25 -0700
Message-ID: <CAMBK9=ayzz3yz-Cbf3vx1=v2bFqQM8Vmyo0NtfoKY0jqGuBk_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/sev-es: Only set x86_virt_bits to correct value
To: Dave Hansen <dave.hansen@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sean Christopherson <seanjc@google.com>, Kim Phillips <kim.phillips@amd.com>, 
	Juergen Gross <jgross@suse.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <jroedel@suse.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Dionna Glaze <dionnaglaze@google.com>, Peter Gonda <pgonda@google.com>, 
	David Rientjes <rientjes@google.com>, Khalid ElMously <khalid.elmously@canonical.com>, 
	Jacob Xu <jacobhxu@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2023 at 2:41=E2=80=AFPM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 10/2/23 13:04, Nathan Chancellor wrote:
> > On Mon, Sep 11, 2023 at 05:27:03PM -0700, Adam Dunlap wrote:
> >> Instead of setting x86_virt_bits to a possibly-correct value and then
> >> correcting it later, do all the necessary checks before setting it.
> >>
> >> At this point, the #VC handler references boot_cpu_data.x86_virt_bits,
> >> and in the previous version, it would be triggered by the cpuids betwe=
en
> >> the point at which it is set to 48 and when it is set to the correct
> >> value.
> >>
> >> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> >> Signed-off-by: Adam Dunlap <acdunlap@google.com>
> > Our continuous integration started seeing panics when booting ARCH=3Di3=
86
> > without KVM after this change landed in -tip as commit fbf6449f84bf
> > ("x86/sev-es: Set x86_virt_bits to the correct value straight away,
> > instead of a two-phase approach"):
>
> I can't reproduce this, but I'm running a gcc-built kernel and I haven't
> tried very hard to replicate your qemu setup.
>
> I did notice, though, that the patch in question forgot to move one
> assignment.  Could you see if the attached patch fixes things for you?

I reproduced the issue as Nathan described and your attached patch fixes it
for me.
