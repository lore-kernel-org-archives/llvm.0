Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38213049E
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360050; cv=none; b=VQ4sz0ycimPfYNV63uPh5yERx/q3mpKraGK6fIKVqc2o9+MeI4lGOmt3E3ElIom0FN0Li0cUXnm9HVdQrDaJCzE4ttVLccauf1RrcZ3IHZ9pa/K34NIHtx8bKAiZ+B01xbAIxb6ENqfnlGzHInYE4LetDX+nvaZ5B2Gxs359dDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360050; c=relaxed/simple;
	bh=82fNJZnDQousYMQ1XpfOTqzQOstJcZvgj58Vf49L284=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oN6nammi0kr7O7v0flD8WTN45SeLu3DTc/6vnzv9qJWag26/vH5RZX7m5rHynvXkgZfYF+zeoZYeWL72zfm04a6gYD900mjxCRgRo86rkbaX2fj9hgAjXhy9/Iod9XGh0IgOdVgHXt79oY5kzHd1TBFf1zPA295gniVFJ09IO7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duneX1vb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duneX1vb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h/KRXwrcWUcxhehV9zVCUAABzklLutRg673niSWYJ3M=;
	b=duneX1vbUsWxIffE+GyjR4qwStBl0hW+7RFNca3OBMSvUlksn6dG6RF7qBeIZP+d7tQfx7
	z8k/3118dX1fX55q90d2lx982wZIFvnS8GWTs6e1edt0by/XJXfJkuvbpNtd+ruHETFAax
	VdftxF7ZYgW9hKYlgCoqJGODtMhCgLU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-UYH1GgD8P5aObuDsbT-PBQ-1; Thu,
 26 Sep 2024 10:14:07 -0400
X-MC-Unique: UYH1GgD8P5aObuDsbT-PBQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60B241979045
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:06 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B36C3003DF2;
	Thu, 26 Sep 2024 14:14:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 1868f9d0)
Date: Thu, 26 Sep 2024 14:14:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <64225.124092610140700999@us-mta-677.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linux-6.12-ofs1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/hubcap/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1463008909

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463008909-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1463008909-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1463008909-x86_64-kernel-debug


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

