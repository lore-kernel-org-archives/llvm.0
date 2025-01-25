Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91EC800
	for <llvm@lists.linux.dev>; Sat, 25 Jan 2025 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737783132; cv=none; b=Wl7h64/+m4WE3UY3uLa9CBWTKW96TK4+ed34rKc9MB29Nd3NoWCg+mrRcuIZaHTZo/h3nPAElzpxEcQ2lQec4A3WATUwTk2iEN6/nfb7/s76R8BcAay51ht2OmbXUaLxI9n/5M+tf3pS6VGHvEOVWy+/PG0ct7gAfrmqmpeDA+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737783132; c=relaxed/simple;
	bh=YOfmk0NZYRJ2bYWO7MtQT7qVCKTUpL2UujxFJcI+QCY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=F5vot5rJs2WXce30DbRcg4H4XN9atlvqCUrlTJFdgLmCN3MnArPvu5mziShixh9oShJoWIj5UHP1LjhfWn9XwqLNj8l35HuxNz70in9CAM0oAYV5BYKjCOkXkcTfBExHW9l3HakNapcOWRPaduwMVkFIdPTmptjzSv0c0Kv0KqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dxwKcyn4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dxwKcyn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737783129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tFzaWjcJgfl5We8Ypp3DJLuPdv6Tv5jOOUKywuc1hwo=;
	b=dxwKcyn4XA69ehwVuB8eqpXhGjoUptnD6IZ18f78CvI7SBKFYpb1B4axWviIPBxL8VNdkr
	UjwSnL0GMj9ymHf6u5/NdtqXzbSmtLXPurG25ThJnJDXDDTbQyAeFyrPKDZ8gZK5K6hezQ
	kIK0B5tCFfmrphuEIL1DzzY2N0AoIp0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-5IxVUrYwPuWM1qVgoFZqOQ-1; Sat,
 25 Jan 2025 00:32:07 -0500
X-MC-Unique: 5IxVUrYwPuWM1qVgoFZqOQ-1
X-Mimecast-MFC-AGG-ID: 5IxVUrYwPuWM1qVgoFZqOQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 974021956080
	for <llvm@lists.linux.dev>; Sat, 25 Jan 2025 05:32:06 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 05B2619560A7;
	Sat, 25 Jan 2025 05:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, f345fc7a)
Date: Sat, 25 Jan 2025 05:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <33261.125012500320700489@us-mta-582.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Aft4vKRfhHih__MS_3ei_rzf8PJ-0p8SHsC4XOTkGH4_1737783126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'devicetree-for-6.14' of git://git.kernel.org=
/pub/scm/linux/kernel/git/robh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1640408597

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640408597-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1640408597-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640408597-x86_64-kernel
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

