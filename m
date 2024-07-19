Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFAD286A8
	for <llvm@lists.linux.dev>; Fri, 19 Jul 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721400787; cv=none; b=nW8F4SbJDW8RWaYZqm2bBvfqKuxNJsJmtbDV1UE20MvVinD42H2x3MHDPghyL80fTPb9iQlQ9whVFsDx9DjSV/0lD0bC3IRbZByAFhlBlq5TBvTcHr1DVv7woVNbkudJeUkiG2PoXV0YDUYmPeJYUX+9B7wjf1LbxyqMTWr3j4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721400787; c=relaxed/simple;
	bh=YqBXlu7D/bpi/IwHBDx++tyDjc3sJF813087HWiqt8A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OUH6qPjIhBG6oJ8VItnsvDN2TxcN3vXZprQHEPG5DtpNhsvA6VKif/skggeMV7UArsSK/ox/42bsaqvhR+6+9z+RVIDRazBmpdhU7TKdyGvceS0xt1nGiC9F/hZtPx4si1U7ASWozed1LIwE5hX+bYfzIv8q3F7xyl8ODU/9uZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIsUBRGn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIsUBRGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721400783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eLoo+W6AEp1JF1d3Bqo2UbwJbZJ75f7zEDO0zGheygY=;
	b=UIsUBRGndUjQm7WEJWMPoz4Pld+hlg2U4Cy8wRRrFoudE9p+0jXOxKtZ13gaG42UxRijvZ
	WS7ye2tjxUZ7T8CZnacQdskYl0eR7UESb9C9v1rU1x+upUcgyAs5mIT80bp/1OLKx3cRgl
	fWaDjTbHPpUMavO6yF632QDMhCaz3Uc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-3gVDcmvBNZKXns7syuNR1w-1; Fri,
 19 Jul 2024 10:53:02 -0400
X-MC-Unique: 3gVDcmvBNZKXns7syuNR1w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7B011955D55
	for <llvm@lists.linux.dev>; Fri, 19 Jul 2024 14:53:01 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 037E719560B2;
	Fri, 19 Jul 2024 14:53:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 720261cf)
Date: Fri, 19 Jul 2024 14:53:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <35137.124071910530206664@us-mta-692.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'bcachefs-2024-07-18.2' of https://evilpiepir=
ate.org/git/bcachefs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1380431529

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1380431529-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1380431529-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1380431529-x86_64-kernel-debug


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

