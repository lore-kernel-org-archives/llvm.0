Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5957AE573
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 05:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743141191; cv=none; b=MJvy5aqBo8bFkCDwq0WhzthJSpGYPqFL8wyMfuwBkBprM1jS5vIdiL6MPPGxysSMX0K4ZYgr7X0xto5tDEMjXGyimFRjfajr6kwL6wdA/rlojX0qBlvvGUOhPrGkHT6gUfns6QHJii3MAAFUUToOXn91kVZblocMg/KGcCJsGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743141191; c=relaxed/simple;
	bh=T/eOjihgMIFRLMvm1SCjPxO10g3hAu87QXJ+BiRRrnc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RW5LW4NIbEiVtI4OgjgAswLHF54KFv8H2+vE5heY5iWTVQvmBxOlYZqJCSWvXT6XmLpvHWLtySXY5mZV6FZuWqld+TW8va6vkVvZ+VUw6yYyrlrrSEddJ7HBUtZyDxMJqpb48Jvn5Czo/k/8J5jGOdSTsF9YRFYTH3bfhMMauL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jPQSUQw4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jPQSUQw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743141188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kz0Vr+GQvGJy7trKqTpS+OVjnmzG8A1BIaMP98QZovc=;
	b=jPQSUQw4jxW4snzffhoC1/rIMrfStB5FKnOY1nfRqjzSnqqVwpboVSMLU/RzEIqxnEcE2X
	KK2AaKYbnGUMeqh7PalrAk9TWbU8fL4YDqX4kqTCnx2ICa+Fp1fFlI6PAAmqxD/Izh+X/l
	3AE1AxR0l/u8mEbbAh3u+/cHza0+VTk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-503-jj9nti9cP8qLuQ1RUSsx-A-1; Fri,
 28 Mar 2025 01:53:06 -0400
X-MC-Unique: jj9nti9cP8qLuQ1RUSsx-A-1
X-Mimecast-MFC-AGG-ID: jj9nti9cP8qLuQ1RUSsx-A_1743141185
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0E3F1801A00
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 05:53:05 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 330871801747;
	Fri, 28 Mar 2025 05:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, acb4f337)
Date: Fri, 28 Mar 2025 05:53:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <33458.125032801530600129@us-mta-503.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bvkXqrTLWbYUhlqUgOnvwXgyQKYloz7t0p-NSRshBXE_1743141185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'm68knommu-for-v6.15' of git://git.kernel.org=
/pub/scm/linux/kernel/git/gerg/m68knommu

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1739484304

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1739484304-x86_64-kernel-debug


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

