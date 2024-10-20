Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509845025
	for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729459390; cv=none; b=BObKjstOLxXiuAcgFSrB2i3646sNshzl9u6YJE1AaZAIl02Ku0du8pYQVsfMxGcWvgmLb1WGE+yOW7WhNkBQJnYO15F5cx6TaWNyDNsCjQ5w6w0fw1a0vDQoqSJciiX5mu/JIxwltpROQAsMxR/U77c7PKXlXmyD48VUJt7fJxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729459390; c=relaxed/simple;
	bh=DAgyIcTcn1iLVLcF38UNErimv1pvEoj+8KBYBfw6IWk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CqWJ5Or2WOgQMav3GnEZY0XjAAChVvHxNKTjN6Ys+W1BAwn5IdRLT8x++71J3tMFVVvOnsDHuPpJ8PDSQ4szNKG3+O6SxLDET7Ya98cIwmCEn3/inpXn+HUt6aLA0+cJARIH79Lx9gnC9jMH5gAru50ST8ooym6iW4Z9uALnIpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBZ66dUR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBZ66dUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729459386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ehr7Lo7dxunIOXXqtsf3q02LFplao4aMx00F4yVTWpI=;
	b=FBZ66dUR6k5lOS8E0m77deIdD55ba+kCl4kSFoc6SAqtXFImUA+IZocMfltk4AgUNlmYO9
	+J1gG6DpSY74f1eea6vXuIX68jyZhc/0Dlm7kSMlqlOspKLuUOqPQ35AOVVS5n9aXhZxS1
	1/N8vo0bYzwnsKwXSV1bDMzPjbNDpVo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-67-b0aXP-jrM7mWbg3HsxA0PQ-1; Sun,
 20 Oct 2024 17:23:04 -0400
X-MC-Unique: b0aXP-jrM7mWbg3HsxA0PQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AFA241956083
	for <llvm@lists.linux.dev>; Sun, 20 Oct 2024 21:23:03 +0000 (UTC)
Received: from [172.64.5.43] (unknown [10.30.32.29])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3893B1956086;
	Sun, 20 Oct 2024 21:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, db87114d)
Date: Sun, 20 Oct 2024 21:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <48480.124102017230400603@us-mta-67.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_urgent_for_v6.12_rc4' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1504332763

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1504332763-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1504332763-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1504332763-x86_64-kernel-debug


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

