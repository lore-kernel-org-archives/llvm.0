Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831C9474
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360114; cv=none; b=hKD1ZUJFeWluwWZOJ9G599A78uGMjsSIOnYF5iUmxzxTPjHHlNj2/qgLm/8bUzlW3nfVfniSRN+vDnJuAXQHBVPpiNvciNyQwtvyUK2HzZ0x4DyOQp2LKzoLbs/4bXeTW173poK18yWpGvfZVhvGB1sWCJBwIPDk2oALsAxxhB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360114; c=relaxed/simple;
	bh=o6Y4SGzvWquEFwvHVdSZHB4osOVUHistDcpZ9TGp9aw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mwqjoJ9HE/MMt08Wqnr+Mmpza08koQGG+r2mscFyPaTzS2E00HOUZSjeBX8u+MxbukFhkWj62y1+3j9E5N55nE5ocy8XHVVtqKVaKLqdKSz/gg846/3D0KkdahuyPwUFbrfeha48fnQrhY/3UM/0GfBR1jSsl9YAxQjJqXH8v5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MmwbMTEW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MmwbMTEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HBcIqULRMhc0vzt3TP/5GeU8mNK8GNxmb4Syt6psVmM=;
	b=MmwbMTEWJEsxMH4A1UT4Z2vuI3w6Xo6PQiWB7ifTVRvr6RgfikWKAasEW2034rx1tCjUDS
	FyTU5bCWGDQSKZkXcDbJ1jXKIDpdINB199Wt1RzSNNDxyPFfCIUtkYp65A2udJkZlJTyM/
	Ckle19NqryQnMzN240k7297ZVAAmXdg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-rHVsSOnxMrS3zuIazccAMg-1; Thu,
 26 Sep 2024 10:15:10 -0400
X-MC-Unique: rHVsSOnxMrS3zuIazccAMg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0AA1B1903095
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:10 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C98761944B22;
	Thu, 26 Sep 2024 14:15:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, ad060dbb)
Date: Thu, 26 Sep 2024 14:15:09 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <81707.124092610151004868@us-mta-659.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'selinux-pr-20240911' of git://git.kernel.org=
/pub/scm/linux/kernel/git/pcmoore/selinux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1455476836

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1455476836-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1455476836-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1455476836-x86_64-kernel-debug


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

