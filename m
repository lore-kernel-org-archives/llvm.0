Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5329B132103
	for <llvm@lists.linux.dev>; Sat, 30 Nov 2024 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732993989; cv=none; b=hOGms0LHGhso5Xvna7ezcHjl/oYqSt7jklA3FLhAd0iW9EpkRGzuKynVpA7CJC9kYF43tCr9th51QnlceaumjK3EThFZp4HpECv2ZHBgDRa/4t5/Zow5QllLTgclGysryXe3W9GO4abGqcFYil+48JJZWXX42HpcmWr1LjDzOHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732993989; c=relaxed/simple;
	bh=h/zOnmr1FmFWnYD6rGn6TVXBakisalw+zqTs9YU76JE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=g2Ka1q9/03dyTJpAhgkTDrlSvIjqvoNlgLBG104Wr4D8WXNAIrS0S+HR4uusLPzZ9foRTQqc5L4y++8xrqCoWssW6rvjkQKmxr8Pfr1b+QxbH8z28zxmjzgXxBUrCPAj3nI/ih6SNDbRnmZNFimjeGmAvctKdKcUO8FM26gF3pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQyi8jPh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQyi8jPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732993985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XlPpSGkF4YRZstJVk5Kmto+RVdZ/vqKWdco65pkJQgE=;
	b=EQyi8jPhUOeO15DIkyb3RlNw4nFxem1owLRTrCdjmzoB8cuPef4rjhO/aZy+WKicwKf4Gj
	UXplb42vjm6ra6zWlVKcTraf+jU/UBZ409ldRxPdQgalwpQqZbIGup9AMSFkcpzKnqa57Z
	K+NZ1L6NlMtiPuj5LdnonzGwO40cWcM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-MLjSFWKWNaO52lEW35KoXA-1; Sat,
 30 Nov 2024 14:13:03 -0500
X-MC-Unique: MLjSFWKWNaO52lEW35KoXA-1
X-Mimecast-MFC-AGG-ID: MLjSFWKWNaO52lEW35KoXA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B995195395F
	for <llvm@lists.linux.dev>; Sat, 30 Nov 2024 19:13:02 +0000 (UTC)
Received: from [172.64.12.14] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D357C300019F;
	Sat, 30 Nov 2024 19:13:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, d8b78066)
Date: Sat, 30 Nov 2024 19:13:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <54245.124113014130300211@us-mta-7.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MnoFIZPOxPZ7oe3eexCIy7HN8EGpruek17BEQOsTVD8_1732993982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'tty-6.13-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/gregkh/tty

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1567217481

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1567217481-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1567217481-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1567217481-x86_64-kernel-debug


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

