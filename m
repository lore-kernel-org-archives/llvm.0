Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC525A62A
	for <llvm@lists.linux.dev>; Sun, 26 Jan 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737920532; cv=none; b=QWfwQ6bZyq7D/vbRJTnfJIyp5sebSbe/CBwWJeHBHO6Up1bW8VTK6eMQMdW6wy6rJ5NRRo8acY0XssVGE+npq3IQNH6rFhxz7oNlvWsZMYbGXcRS0SUdz80/h0Nw0nk9Nv0dX3FIc+NyvBntXp3o+yxHGonyo/ULrFmuy3iFztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737920532; c=relaxed/simple;
	bh=keCc6CAYUHIXbJoxlA4cCc654XU+OC7Sr2ognYMmfc8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UF6jXcUoCB5wUCh/i+qIBnm5h5usjTmc/OqSSnaVi5zmT9h9aI3Ht5DgH5A9diCDPlv6eVXwPMRuLgRCf/fKa1azdNiRjukPwLmLqgGxaYkaSLYiJP6w1j8CQlj0T6rNWSiGAPiFmwvA4X5QYa/OoHH+RR3K5nkumPnEhwEPpjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RcdjgoqE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RcdjgoqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737920528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4nX5PvAJ/kLQnCMKV0XbukfsJwX5svg6sR5f613XW2E=;
	b=RcdjgoqE95jXdtCB5Cpl78sbR0LenColE+OJs0fsW2SUXHzP9iKktIykx9VGfPN9mb4uTm
	9oYu+6ld5xHQSeLJKqKbscqCzQ2CSasu1t8GJq6fG68kBHByOdHY3MGeKiP3g9kSy9q38Z
	o1UE0LkLYFwh5YSMtfH11rjZKmJN19U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-225-cYAEImEaMNmByNIDnaylcA-1; Sun,
 26 Jan 2025 14:42:06 -0500
X-MC-Unique: cYAEImEaMNmByNIDnaylcA-1
X-Mimecast-MFC-AGG-ID: cYAEImEaMNmByNIDnaylcA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C7B1519560AA
	for <llvm@lists.linux.dev>; Sun, 26 Jan 2025 19:42:05 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 70EB030001BE;
	Sun, 26 Jan 2025 19:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, c2da8b3f)
Date: Sun, 26 Jan 2025 19:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <90124.125012614420600273@us-mta-225.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9v1MXevanLvyh0FI3VJ8AApX-BG4pBC__SiOgXGY670_1737920526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'erofs-for-6.14-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/xiang/erofs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1641583432

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1641583432-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1641583432-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1641583432-x86_64-kernel
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

