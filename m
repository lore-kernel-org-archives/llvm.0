Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2DD1E1A3B
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413988; cv=none; b=Zu7p7ViTJMvkyDt+ZmA29vV3RMRQfjurgVhVywYXpjnzLre1dAqdqYsjC6/S8Jdgmmq85xGHfi9NR0/cg4+83uo77UBzyl1W5HnTGZIiJJn9qjCB3CQTNsXCu+hD4zbfwpD5SUGhhncZYgL/Z0UILSYfDNyfjLLhffgsWqby1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413988; c=relaxed/simple;
	bh=kt51fiM7LLESBm6rjGZBgBQ8Nj6Y18907gHO99lUbnY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=IySM6b7RbnVGcLVAo7masmrdlgf3tIYB93aDPPrP8Ht7adOGRQcVJeB6EBU41H3RxLlA4RWh83bd7jDG7lPS1fwEwjqxr57YMKQzT9aKqd/dK3by7d0JGz7mfjBryWBBHJ6R+US6Nr1l6gfgy3rAXDiS+HNI65X60mBw1vLYWgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eg5uw6e5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eg5uw6e5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748413984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RykzZ0SNaXHVdtyZS2rPWMm/vaKWEqvzT8PfgCdlKeY=;
	b=eg5uw6e5YY4WHwYdYltF9u2DWFZt+qkdv5yXOvHajF1SlwgoxnvAPFgkYPk21ELs+zFJCW
	dubvLqqRbr7NApwC8PsHZk/CS2uc99cCbp2gq6+ZoEgE2zXsAjt9VQ9w+6tYyR1pN30upq
	JnGbWceu1keSCfmECiy3inHFjmGZid0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-2pztl_gPMpmT-8Q3oenl6Q-1; Wed,
 28 May 2025 02:33:03 -0400
X-MC-Unique: 2pztl_gPMpmT-8Q3oenl6Q-1
X-Mimecast-MFC-AGG-ID: 2pztl_gPMpmT-8Q3oenl6Q_1748413982
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AAA21955E79
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 06:33:02 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E1A7819560AF;
	Wed, 28 May 2025 06:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, feacb177)
Date: Wed, 28 May 2025 06:33:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <38250.125052802330300195@us-mta-563.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Co0nVxhPNQKHlyy4cBdhYf_axBrJnCYBRZUb3lMuK_0_1748413982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.16' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1840063200

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1840063200-x86_64-kernel-debug


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

