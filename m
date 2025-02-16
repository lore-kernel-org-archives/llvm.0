Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56452610D
	for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 02:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739673730; cv=none; b=gANKFozr56b5aCzNNoHM8F5e8L3SBTpNNjuWZCQRmKCk50xnhUwSUJpe0RTToMPKVFHn95ul5VLCDkGZumix1O7DN/mC+e7GyV35SFIrs9vZluzYwRLGvmqfItnXrbGUlcdjDTVYOBPOZmne6ZXPX0IQewn/ESobGttB793BozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739673730; c=relaxed/simple;
	bh=WgpUjWrRsJ//3Vwd85S01LrivJ97APvG0SQZlHZbtzQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=TJvA7QubjLZR4E0PiHDS9JqBEgnt0uhCFQ3kJTTBIAYBONbCvwHlYrzgMy9YnZjtVlZP9LT9lz2caxy/6Epeuy7wIPL+cevgyOX6jK+M1ccXwM0ECBE4fYsSJRJgvQVUHJ18aYo6mXGxBw0ERaMqL7bcIHZQ8TUJF3mpr5XE5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dh9FVuV5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dh9FVuV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739673727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lQPot6VPU6NpXtdiJz/+sI0BNVhpBf2rlCW7ATCn1AY=;
	b=Dh9FVuV59f+KsLa64bwBAUxigVUDRmj/UmMX1yD1HWhHzHQvEWZEZEGW9Hs1Tn11H6rCpE
	QAvp7Up/qgFcfEDR0Fuh3R+Mv51mtlqETupHsu1WQ9oj2HoGXRJilBBqBqfB+lGy4CTGdu
	z+DeOPV/R+Q9oBWaQ/LQkzQpNrEnxXA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-ykJUjOy-PAyxntXpxIU6aQ-1; Sat,
 15 Feb 2025 21:42:05 -0500
X-MC-Unique: ykJUjOy-PAyxntXpxIU6aQ-1
X-Mimecast-MFC-AGG-ID: ykJUjOy-PAyxntXpxIU6aQ_1739673724
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 711A71800374
	for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 02:42:04 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2D9F1800359;
	Sun, 16 Feb 2025 02:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, ad1b832b)
Date: Sun, 16 Feb 2025 02:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <50032.125021521420500287@us-mta-402.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BXXMw5r7dwXWEyfcKjK5qQiks5gJQNwMQqnoV8GiwcY_1739673724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'devicetree-fixes-for-6.14-1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/robh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1673028197

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1673028197-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1673028197-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1673028197-x86_64-kernel
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

