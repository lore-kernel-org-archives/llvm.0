Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2739474
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360138; cv=none; b=g2uz63WkEAyoxzleZu/wURgtGLDcPYAIN4ZH/FG19+A6qbVKwNLFyP4cU/2/DL1yJ5+SjZttUeOwY469TTU5v/gYD4oz3gYO7q+Th578CxoG3hHGTr/c9DYYMovwqJigqvFW0FByZmA8vN4ow72lOvC8oE5M/+aviNHGgfSJvGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360138; c=relaxed/simple;
	bh=FafpPcpRWS3nN/GYds0DaPGFX2LWefBB3MMsFR3MziM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=TChe6PW9HUEBPmIKzuVb2gsoEUEMkOYZhCvhgiFvh/sUfRVbddR+aJtMwVj8ki4k0y00d4D48W2SQUZVGe2snOwedGLoS06m5iStejrxhhx+MIiWWsiPN6ckmoGBflTpIGCqnjYVBJmZ1vtrYNQ5IPF/zr65tvO4vUXOzh5OGyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=URuf36zb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="URuf36zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CY8aR9WVwLrYkNu+sSGoKCUsHj4utJ6PZTMWtsHflhA=;
	b=URuf36zbI2btAyA+HRKzXUMRUT+kTTA62cXZvA+z4zKgNlVcdgORO/zCpUy7KjH2E5SvrN
	zR5yPXDbpEeXugFudTCL2aCEDYatMPoTwfGkdUXwfD0Vz2qG4ZigFKCs3pF1MPSLf99U6D
	ydN05R/AeZCB7Akj0Fcnwu+353qqHxs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-EBuQuYnLNdq7ZWEaLxDlzA-1; Thu,
 26 Sep 2024 10:15:34 -0400
X-MC-Unique: EBuQuYnLNdq7ZWEaLxDlzA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F335B19137BD
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:32 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 62E421955DCA;
	Thu, 26 Sep 2024 14:15:32 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 98f7e32f)
Date: Thu, 26 Sep 2024 14:15:32 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <44974.124092610153500297@us-mta-652.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.11

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1454200529

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1454200529-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1454200529-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1454200529-x86_64-kernel-debug


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

