Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6307C233D80
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731091931; cv=none; b=PvYqZ6tONA29en/MXksLRQPEGrnfnLgBgxnA5f2qRbgBxzvIVHnyE0kywhNBYvlGHKOAYy4u51JUEZlLTWh5gqzspcH2Q+sHMuRDNdAmGMy4225hwKohvnibp8jAeLVIgPZ0QETeGS00cw+kMjKyMsMi0zim2nR5O7+AJq9xh9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731091931; c=relaxed/simple;
	bh=DCEwBdjjJYM6ZD/92f5HvcMY0DaCxoE+BSm6PAL9Nvg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QgoAowvoQaCABtklUcBir/cZUjXYeTyAkODdk8r+n5FJk/vKUul9A2KJT0Fuy4ovFUX86Gv680OZeW+EwdQHRl1PteJzznOgAK2NQNLyG6PjDW/K8UMjVNpprQHR+Z2mgjkoSlgzyZJU8dsLRXqoHfQXxDvaCokSDy153kRIh+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LoIE2K4I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LoIE2K4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731091928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hPr+iGKbwDXShpJBAsr10N/VYRsgXIiPcm7JHZ+rjHw=;
	b=LoIE2K4IugD6wJpcBAT0KIZfKVOdXE3bLfzMNfVhgZgILykund5xjRx+pta67wnzYq64Sf
	lEo3pgCpYmBh4CRgwtBYu/Ae3JTZb7jihHve72RIvoIg3l2EprPoxG4K6Ba7qn2l0M2Q3v
	Q8v/HYCZhCrd+CL5cEx0EObP3uuwPZM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-y9JzrW3EOvmkCbaLFT658g-1; Fri,
 08 Nov 2024 13:52:06 -0500
X-MC-Unique: y9JzrW3EOvmkCbaLFT658g-1
X-Mimecast-MFC-AGG-ID: y9JzrW3EOvmkCbaLFT658g
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0450C19560B4
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 18:52:06 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 899F61953883;
	Fri,  8 Nov 2024 18:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, 50643bbc)
Date: Fri, 08 Nov 2024 18:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <81375.124110813520602822@us-mta-617.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AYSPSYFNm8hTwragxwIZCfzZcdD5oZA66gKSpGetpJg_1731091926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sound-6.12-rc7' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tiwai/sound

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1533986611

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1533986611-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1533986611-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1533986611-x86_64-kernel-debug


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

