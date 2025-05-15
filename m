Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F2423741
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 23:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747350132; cv=none; b=gJyK8gx1/EZBCV2b2fZWkoGwSMPkeeq0peBTe2nf1tyVXVffuKnuw/YUJTOnyI8Au4Lxk+ziuNuX9mNkDLxYaPl/AGykWyUNw+BctpFco0IUnggsoqSGClwm7BUg7HmccMLC1ReHRy/T6UF3UzUcnZbaiuptAJ5nYRFcD83t1s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747350132; c=relaxed/simple;
	bh=Fm004axBDL/ACUfRptvE+zs6LGo7WpvpVas/JAh4F7U=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NSGv9srxmKmYBhqw/+b/mHF+NV5N5W8P2C9W8gXJ3imQhTvs0XTc59EZCqn77IuI83ztTW6vUJTKCEvznoEZnpa+fZGe8QPvnAqXKGH6iB8oyPo3sULc0vZHY9VvylQ6b3yBsZ5uu8RFFy/9n8fmsBShGLX3eqS2ywQsldZY/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M7pzSTpZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M7pzSTpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747350128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wbH8lepYeKJ6lfdTjtQSy40+GlHaQggaSkjm3fZq7m0=;
	b=M7pzSTpZ9o3DXVxBn+OJcKX3qh7fvI5Kvdrw+g+JPSlM98R0zZEgVTxCJkhFVbZA7RBLHF
	IcieTuQlSf9a1nRAUdxEDa3uG+0tM/81ayRY6/NeFGUlOSkcMaXh0Ph2q1L2rl9utwTdNE
	TI0IUKuOoZwE1nE5lrlO2zDGv7PbfCs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-yuPvUE0BN7KBTZbdzytC1g-1; Thu,
 15 May 2025 19:02:07 -0400
X-MC-Unique: yuPvUE0BN7KBTZbdzytC1g-1
X-Mimecast-MFC-AGG-ID: yuPvUE0BN7KBTZbdzytC1g_1747350126
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EE4E180087B
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 23:02:06 +0000 (UTC)
Received: from [172.20.105.126] (unknown [10.30.44.142])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A78931956094;
	Thu, 15 May 2025 23:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 4d0be1aa)
Date: Thu, 15 May 2025 23:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <53792.125051519020700629@us-mta-682.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J35M5gmgAIHc40InQX9F1IUGDvRJUhU9FGaSnquJY6Y_1747350126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1820123787

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1820123787-x86_64-kernel-debug


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

