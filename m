Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31D156CE
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723596131; cv=none; b=TSfHNbH86GXQQJX1/eZ63RuX7sE/U/tQNCAQZmp3+dnAMnPsfeOcAAiSNCBFlqY1ckL7yau98ayFSm8NhxvGOGVQam82U82CW5UMBCzOyNxIDwA9fQdrg/1fj8sRFkv/d5Ot9VI2hh9zNE6bfPr7nHdM3oD4d8qpSflQSKhVS9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723596131; c=relaxed/simple;
	bh=Pcx0B12AH4BlLSgj5f8hBjq0/d9ZJhuf6BWNIlZ9Yfk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=I4GV5tmjIVuJoFkqlHKfyrLPLzM+D83iX7LRMxl+q8lANBJctmMJMv868dzruUvuuj5ylQUP5JwWQaYZpLrfnBgNPSUn0RIr/1o1DgIW2EiqnAvI074joq4TY7myQLjwfEV7xzhZN6baCNpSSc56HCAFiyFgYqWW3tvmxU0orls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCiaJUk5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCiaJUk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723596128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hLCP2Jz5NpiqpX4uHps3fsWJzLFsdkVeRzQ7eM5kEVM=;
	b=TCiaJUk5Y9bsHEUrLOFt20V6OyBZXcbx6PJHyub14lgtADYFVuCUID2rVzn5ImN+QE2FSH
	u8N0O044ZVRmT8PpCe13NFolMXfecku/ehiHbFoYdzs0ROZYkV99FpWbT+MLQ5Yfyfvhcq
	nwdjlrpp2LLgFDLPkRTwxG+FbLA203g=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-LeRaxbndMDWzuACvS5ftGQ-1; Tue,
 13 Aug 2024 20:42:06 -0400
X-MC-Unique: LeRaxbndMDWzuACvS5ftGQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 286E11925380
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 00:42:06 +0000 (UTC)
Received: from [172.64.4.23] (unknown [10.30.33.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1273C1955F6B;
	Wed, 14 Aug 2024 00:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc3,
 mainline.kernel.org-clang, 6b0f8db9)
Date: Wed, 14 Aug 2024 00:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <74068.124081320420700114@us-mta-414.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'execve-v6.11-rc4' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kees/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1412403813

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1412403813-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1412403813-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1412403813-x86_64-kernel-debug


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

