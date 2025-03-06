Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CE2777FD
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741290801; cv=none; b=QbQf7eT8QCMIEti4N0NKNslc7Y53XAImJLr/qe8KK8kqxZ+48ldXES09WOXwBrWuw3VpYQYQqtxjzpuQLE0DZn50aLXC2xU7xj2CDeWwSxola3lwBthDyHaBBEDFx9pAWo/ZqGqgdlGnc3gAekt1lVgzZ2g+v0lLQ15jqFaszew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741290801; c=relaxed/simple;
	bh=cx3242kLQNTAoAkSzC3tOs6e4oU2qnu4p6R61+qtAIs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Z9rfHxYzQfAB14ZX82j/xp6FJ779kKFuhIGLt4uFnyjlVZvCRqo81y1p+oMTfvCfYV8Nc9NREV+2EC2eHOta21AcJcUSfMFsJKIc13ot4n71hL0NKV18f59ZtbuSM3KfqR+4n3EB6JQ6JH4n+z6vFdofXXURFM9/B3JZ6POv/+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FjNOHAnY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FjNOHAnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741290798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXb1FF28c8V5Js50wZ6YijXIbx0Z22PlWaYraL8z0vw=;
	b=FjNOHAnY6jtq/eiyQa8EkRHGH5jOXnTCe5/EibGnQpujEz8ma1yHncZ28eZQc7qQLrQNVu
	/hnNpMmhAG0GIc7ZAQBRqq/JSpIBSNcUtbD6gwhJTyuWzYmKRY3aFMs7sGflwn58W7ELVd
	MHtyyigR3MiHqOj9O0p43JZ6i1Nkh6g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-ZIvwpMb_Pg2sYcQK_bQdeQ-1; Thu,
 06 Mar 2025 14:53:07 -0500
X-MC-Unique: ZIvwpMb_Pg2sYcQK_bQdeQ-1
X-Mimecast-MFC-AGG-ID: ZIvwpMb_Pg2sYcQK_bQdeQ_1741290786
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B75D9195606A
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 19:53:06 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 855151956095;
	Thu,  6 Mar 2025 19:53:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 7f0e9ee5)
Date: Thu, 06 Mar 2025 19:53:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <23701.125030614530701233@us-mta-172.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yM7CD_DdFx7OrhO9SCroLXoqM4t8tkDmGsZymiD7gM4_1741290786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfs-6.14-rc6.fixes' of gitolite.kernel.org:p=
ub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703583716

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703583716-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1703583716-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703583716-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

