Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF4A55
	for <llvm@lists.linux.dev>; Sun, 24 Aug 2025 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756054390; cv=none; b=oJGmjsrF/TX0G+gf2mKYGg5ys7dJJroktviaNZXhQnbXNph4aBO4AGBa3aFYdnsXQSXvXreMQq5Me/Ptxbfv/DEiVME+3wBFlhTEvz4FpGoRcCUQ3KdilFZoE1Gq34tpfhCR8tTJgC2EOXPLm9/f/D5QL6Yz7I1ggjrcjpJi2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756054390; c=relaxed/simple;
	bh=NOkftqDk4AEJbuiUWAJVC9CuhG5lwyOp1JIzV2ztLac=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FeAjPbH42VF/KSWXynzQmACzkc0NOJF3C0dJMzfXjrdN0jDutk9/ND6AaoEb72ceHzD+X1JYIEsB8ev7x1tecrYxgReGSmjWDyKx8BMpLBBLVHtT5I9qNFcFAcJee9R+UmnVQW2lZLGaSNlsrL0uzzOwOHkud/0+YH9TZB7SHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SEt48QLq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SEt48QLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756054387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oFqdIPoF56JesxWcS08Dn1CdDNSCd50QD5tONmmR5iQ=;
	b=SEt48QLqU/BiwvMh2m2OcQeHO4lJQWBRMo1UerjxV8VAAyGZaN/XEG6Lps1MERLbjF7tGn
	aLnJfvuQK2WeYiOHAD7tdY/AnpcgeFKE4oEkhoDmJtCxW7XK6QlkXJ3xksBC/T3i0V4dRa
	c8F+pegk7pBG/IgfHkUrYKHRhLyHIo0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-1XnfyuiOPUaRil-mUW88iw-1; Sun,
 24 Aug 2025 12:53:05 -0400
X-MC-Unique: 1XnfyuiOPUaRil-mUW88iw-1
X-Mimecast-MFC-AGG-ID: 1XnfyuiOPUaRil-mUW88iw_1756054384
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2FDC81800451
	for <llvm@lists.linux.dev>; Sun, 24 Aug 2025 16:53:04 +0000 (UTC)
Received: from [172.20.48.110] (unknown [10.30.45.91])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B08D919560AB;
	Sun, 24 Aug 2025 16:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc2,
 upstream-mainline, c330cb60)
Date: Sun, 24 Aug 2025 16:53:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <90734.125082412530500185@us-mta-190.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vjL1jgkQOCr3kqI66duYnfyYOdE01OMDf9ANwsBn87o_1756054384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'i2c-for-6.17-rc3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/wsa/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2000772086

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2000772086_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2000772086_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2000772086_x86_64_kernel-debug


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

