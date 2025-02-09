Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E31E3772
	for <llvm@lists.linux.dev>; Sun,  9 Feb 2025 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739139130; cv=none; b=QAEpHLJspGJRe6EPZOKXvaQK0WuuWKt6KnLXL0EqG/mPN5ELRXqlOf9kFR/6RudLz8k23I6PQT06le+uog+XUOIITV3n+ljsI/m6gZJiT8yfCzLSDKzH3yEcQpxKUCtnafTL3hWuaoCH6ATkSWAZ2XCfiuk4Mcw32fMsZbfdZRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739139130; c=relaxed/simple;
	bh=xheGwORb+6FHW8+zntpMvLtmGemKZrGfXfjV38aXepY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uTw7+R0sySmDpzikbHr4WJtZMq6hjIs3QmVZyKZN3hFsOx6HWiean9nZyyhvbLqScyu9wiRk96Qya7PibFAM+FZK2fAj1TBf7HQvnnsgnHrTAQP76FN9ryX+axkWNZOoga8KUwTTAf1QPREP4CI4UVSi6L6SHPnqMdWj/apiGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WXCooniA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WXCooniA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739139127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=62+4c9ynGU8/wjG/gKS82e12hLffKjl5UgWPSMyIZQY=;
	b=WXCooniAkEuOW/y9YZM6NSi+2Fy9CjR6BN5gVkyvAF/JcbKePRFaj5Awu2KNbSi/Ie9xCM
	Ty6sIKxu5qQ304NLdnp9UO4qu8gGQR5mYNHTGjvWvvFuEqgCtmLD7JOM/GHMnZDZgE4SeJ
	c6wl0rY2pNDtkHByv1E1+DrrOf7ByJM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-0wQAt_ryOpu6yLFC8uxD0w-1; Sun,
 09 Feb 2025 17:12:04 -0500
X-MC-Unique: 0wQAt_ryOpu6yLFC8uxD0w-1
X-Mimecast-MFC-AGG-ID: 0wQAt_ryOpu6yLFC8uxD0w
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A58AF1800373
	for <llvm@lists.linux.dev>; Sun,  9 Feb 2025 22:12:03 +0000 (UTC)
Received: from [172.64.12.31] (unknown [10.30.33.24])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 36FC01800360;
	Sun,  9 Feb 2025 22:12:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, a64dcfb4)
Date: Sun, 09 Feb 2025 22:12:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <40259.125020917120400825@us-mta-335.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cZoiNe4vPznNytOhQzw8csSh2ZdkxIpmuWqnLcuyRCc_1739139123
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.14-rc2

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1662885509

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1662885509-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1662885509-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1662885509-x86_64-kernel
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

