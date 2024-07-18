Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFBA69D31
	for <llvm@lists.linux.dev>; Thu, 18 Jul 2024 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721333528; cv=none; b=C6DkY/z4aIWzw5+jWx8wxoZn93qGJtSw1ja3Z9Puhd+/jKwmn52GztFcR4x4QZneL5Kjkk4HtMNsSLnhUhwqly04S+qm+PRfWfHdzmxgQKewrgqiVbDkNw95w1zd+WFTZhaPX6JbNdq563k/acZ/c2Gzfs63SqZwa9Xehf+o6ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721333528; c=relaxed/simple;
	bh=Jrdla7Gt8RwjWnB1bJKynOaVUDaUN62zXTuwHyg+kD8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=q6tmpx/Gdr6Nc+XKdFkeFhfHFrnpl8dcotOYz3RigV9ZvzzQA160XV6ZCIXw4OxXS2jSck0Px9JVsal8bu8jIAKOiEmo0dUXaFzVaBdF+mojjYGWwTDtXCvvtU5EMCl0CTpJCzsPN0j8j3A9C15kSgy0kPSfuVIqFFQ0AQeoPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZN5ts2g4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZN5ts2g4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721333526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xx95WM6TObmSXdP0VNFoEZV0r1zGjRFGPTYlfG3lYm4=;
	b=ZN5ts2g4x7l62wmswlkw4nb6JcTttR4jYt3XE6iols1iNNmXnw/aybVvUa45wSUR7WOlLt
	LjTF65hRvcKsFKpy5horFR9x/w8cUY7DDERFPUOb6Tbl5H+UFd81UsnW5wxLTAyx3G/squ
	b7C3/XxG1EkumFijSaDld4yiy3nmjVs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-gere5Ct4OdmPVGw1l50HlA-1; Thu,
 18 Jul 2024 16:12:05 -0400
X-MC-Unique: gere5Ct4OdmPVGw1l50HlA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DF471944A84
	for <llvm@lists.linux.dev>; Thu, 18 Jul 2024 20:12:04 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B483D3000189;
	Thu, 18 Jul 2024 20:12:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, cb273eb7)
Date: Thu, 18 Jul 2024 20:12:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <16276.124071816120500617@us-mta-125.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'fbdev-for-6.11-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/deller/linux-fbdev

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1379390753

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1379390753-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1379390753-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1379390753-x86_64-kernel-debug


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

